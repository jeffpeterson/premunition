Sequence do(
  escapedWithCode := method(code, 27 asCharacter .. "[" .. code .. "m" .. self .. 27 asCharacter .. "[0m")
  asBlack         := method(escapedWithCode(30))
  asRed           := method(escapedWithCode(31))
  asGreen         := method(escapedWithCode(32))
  asYellow        := method(escapedWithCode(33))
  asBlue          := method(escapedWithCode(34))
  asMagenta       := method(escapedWithCode(35))
  asCyan          := method(escapedWithCode(36))
  asWhite         := method(escapedWithCode(37))
  underlined      := method(self .. "\n" .. "-" repeated(self size))
  titled          := method(self .. "\n" .. "=" repeated(self size))
)

Munition := Object clone do(
  focus ::= nil
  passedCount := 0

  init := method(
    setFocus = method(focus,
      "\n" println
      focus asYellow println
      "" print
      resend
    )
  )

  assert := method(
    assertion  := call message argAt(0)
    label      := assertion label
    lineNumber := assertion lineNumber
    if(call evalArgAt(0),
      "." asGreen print
      self proto passedCount = passedCount + 1
    ,
      "\n" println
      "FAILURE describing #{focus asYellow}\n" interpolate asRed println
      "#{label}: #{lineNumber}\n" interpolate println
      "\t" print
      assertion asString asRed println
      System exit
    )
  )
)
