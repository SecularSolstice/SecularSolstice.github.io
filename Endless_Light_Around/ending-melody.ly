\version "2.16.2"

\header {
  title = "Endless Lights Ending Melody"
  subtitle = "A Link of Evening and Morning"
  composer = "Raymond Arnold"
  copyright = "CC-SA-BY"
}

#(set! paper-alist (cons '("my size" . (cons (* 6.5 in) (* 3 in))) paper-alist))

\paper {
  #(set-paper-size "my size")
}

melody = \relative c'' {
  \time 3/4
  \numericTimeSignature
  \key f \major
  bes4. bes8 a4 g4 f2 bes4. bes8 a4 g4 f2 e4 f2
}

\score {
  \new Voice {
    \tempo 4=150
    \melody
  }
  \layout {}
  \midi {}
}

  