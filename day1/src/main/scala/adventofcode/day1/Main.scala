package adventofcode.day1


import cats.*
import cats.effect.*

import adventofcode.common.Name


object Main extends IOApp:
    
    def run(args: List[String]): IO[ExitCode] =
        for
            _ <- IO.println(s"Hello, ${Name.Default}!")
        yield ExitCode.Success
