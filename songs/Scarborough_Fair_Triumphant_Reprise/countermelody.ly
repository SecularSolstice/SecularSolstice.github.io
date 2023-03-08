\version "2.18.2"

\header {
  title = "Scarborough Fair Triumphant Reprise Counter-Melody"
}

vocal = \relative c'' {
  \clef "treble"
  \numericTimeSignature \time 3/4
  \key e \minor
  d4 c  b  c b a  b  a  g  e2.  \break
  g'4 a  fis fis e  fis g  fis d  e2.  \break
  g,4 a  b  c  b  a  b  a  g  a2.  \break
  a4  b  c  d  c  b  c  b  g  a2. \break
}

words = \lyricmode {
  Please not the wool -- en the worst of them all
  See how it itch -- es and pricks at my skin
  Bent o -- ver wel -- ding ma -- chines to cre -- ate
  Sleeps in the si -- lence of awe at her work
}

\score {
  <<
    \new Voice = "one" {
      \tempo 4 = 120
      \vocal
    }
    \new Lyrics \lyricsto "one" {
      \words
    }
  >>
  \layout {}
}



