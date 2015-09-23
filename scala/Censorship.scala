import scala.io.Source

object Censorship extends Censored {
	def main(args: Array[String]) = {
        println(censor(List("Verdammt", "das", "ist", "so", "ein", "Mist")))
	}
}

trait Censored {

    val censoredWords = Source.fromFile("./censored_words").getLines().foldLeft(Map.empty[String, String])((wordMap, value) => {
        val splitedValue = value split ":"
        wordMap + (splitedValue(0) -> splitedValue(1))
    })

    def censor(list: List[String]) = {
        list.map(w => if(censoredWords contains w) censoredWords(w) else w)
	}

}
