import scala.io._
import scala.actors._
import Actor._

class Page(val data: String) {
    def getSize = data.length

    def getSizeWithLinks = getLinks.foldLeft(data.length)((sum, m) => sum + PageLoader.getPage(m).getSize)

    def getLinks = """<a\s+(?:[^>]*?\s+)?href="((http|https)[^"]*)""".r.findAllMatchIn(data).map((m) => m.group(1))

    def getLinkCount = getLinks.size
}

object PageLoader {
    def getPage(url: String) = new Page(Source.fromURL(url).mkString)
}

val urls = List("http://cnn.com/",
                "http://cnn.com/",
                "http://cnn.com/",
                "http://cnn.com/")

def timeMethod(method: () => Unit) = {
    val start = System.nanoTime
    method()
    val end = System.nanoTime
    println("Method took " + (end - start) / 1000000000.0 + " seconds.")
}

def getPageSizeSequentially() = {
    for(url <- urls) {
        val size = PageLoader.getPage(url).getSizeWithLinks
        println(url + ": " + size)
    }
}

def getPageSizeConcurrently() = {
    val caller = self

    for(url <- urls) {
        actor { caller ! (url, PageLoader.getPage(url).getSizeWithLinks) }
    }


    for(i <- 1 to urls.size) {
        receive {
            case (url, size) => {
                println(url + ": Size:" + size)
            }
        }
    }
}

println("Concurrent run:")
timeMethod { getPageSizeConcurrently }

println("Sequential run:")
timeMethod { getPageSizeSequentially }
