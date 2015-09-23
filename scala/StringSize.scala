object Strings {
	def main(args: Array[String]) = {
		val strings = List("Foo", "Bar", "Baz", "Bla", "Hallo", "Haus", "Stein")

		println(strings.foldLeft(0)((sum, value) => sum + value.size))
	}
}
