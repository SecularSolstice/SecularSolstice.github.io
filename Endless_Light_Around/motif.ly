\version "2.16.2"

\header {
  title = "An Endless Lights Motif"
  subtitle = "A Link of Evening and Morning"
  composer = "Daniel Speyer"
  copyright = "CC-SA-BY"
}

#(set! paper-alist (cons '("my size" . (cons (* 6.5 in) (* 3 in))) paper-alist))

\paper {
  #(set-paper-size "my size")
}

melody = \relative c'' {
  \time 6/8
  \numericTimeSignature
  \key f \major
  a8 d e a, d e
  g, c d g, c d
  f,2.
}

\score {
  \new Voice {
    \melody
  }
}

  