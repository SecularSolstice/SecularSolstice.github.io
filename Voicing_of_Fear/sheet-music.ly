\version "2.18.2"

\header {
  title = "The Voicing of Fear"
  subtitle = "A Song of Night"
  composer = "Daniel Speyer"
  copyright = "CC-SA-BY"
}

mk = #(if (ly:get-option 'drop) #{ g #} #{ a #} )

melody =  {
  \numericTimeSignature
  \key a \minor
  r1 r r r r r r r r r r1 r2 r4

  a \time 3/4 c2 d4 e2 g4 f2 d4 a'2. ~a2
  a,4 c2 d4 e2 g4 f2 d4 a'2. ~a2
  a,4 d2 e4 g2 a4 e2 c4 f2
  a,4 a2 b4 e2.~ ~e2 f8([ c)] g2 f4 \time 4/4 a1~a
  
  r1 r r r r1 r2 r4
  
  a \time 3/4 a2 c4 c2 e4 d2 c4 e2. ~e2
  a,4 a2 c4 c2 e4 d2 c4 e2
  a,4 a2 d4 d2 g4 f2 d4 a'2. ~a2
  a,4 a2 b4 e2.~ ~e2 f8([ c)] g2 f4 \time 4/4 a1~a

  r1 r r r r1 r2 r4
  
  a \time 3/4 a2 c4 c2 e4 d2 c4 e2. ~ e2
  a,4 a2 c4 c2 e8 d8 c2 a4 e'2
  g,4 a2 g4 a2 g4 b2 a4 a'2. ~a2
  a,4 a2 b4 e2.~ ~e2 f8([ c)] g2 f4 \time 4/4 a1~a

  r1 r r r r1 r2 r4

  a4 \time 3/4 d2 e4 g2 a4 e2 c4 f2
  a,4 d2 e4 g2 a4 e2 c4 f2
  a,4 a2 b4 e2.~ ~e2 f8([ c)] g2 f4 a2. ~a2
  a4 a2 g'4 e2.~ ~e2 r4 r2 f8([ c8)] g2. f2 r4 \time 4/4 a1~a

  r1 r r r r r
}

rp = \transpose a \mk \relative c'' {
  \numericTimeSignature
  \time 4/4
  \key a \minor
  r1 e4 r a,, r
  r1 a'4 r a, r
  r1 e''4 e, a a,
  c'4 c, g' g, c'4 c, g' g,
  e'4 a, e a,  e'' a, e a,
  e''4 a, e a,  e'' a, e a,
  
  r1. r2. r4 a''[ e a, e] r4 r2.
  r1. r4 a'[ a, e' e,] r4
  r d'' r r g,, r r e'' r r f,, r
  r2. r4 e''[ e, a e,] r r2.
  
  r2. a4 e'' a, e a,
  g'' g, d' d, g' g, d' d,
  f' c f, c f' c f, c
  a'' a, e' e, e' a, e a,
  
  r1. r2. r4 e''[ e, a a,] r
  r a'' r r e r r a, r r e r
  r4 a r r d, r r a r 
  r e''[ a, e a,] r
  r2. r4 a'[ a, e' e,] r r2.
  
  r1 e''4 a, e a,
  g'' g, d' d, g' g, d' d,
  f' c f, c f' c f, c
  a'' a, e' e, e' a, e a,

  r1. r2. r4 e''[ e, a a,] r
  r a'' r r a, r r r r r e, r
  r4 a'' r r a, r r a, r 
  r e''[ a, e a,] r
  r2. r4 a'[ a, e' e,] r r2.
  
  r1 e''4 a, e a,
  g'' g, d' d, g' g, d' d,
  f' c f, c f' c f, c
  a'' a, e' e, e' a, e a,
  
  r d' r r g,, r r e' r r f, r
  r d'' r r g,, r r e' r r f, r
  r2. r4 a''[ a, e' e,] r r2.
  r4 e'[ a, e a,] r
  r2. e''4[ a, e a,] a''[ e a, e] r4
  r1.
  r1 a4 e a, e
  dis'' a dis, a d' a d, a
  e''4 r e, r a'4 r a,, r r1 r
}

lp = \transpose a \mk \relative c {
  \numericTimeSignature
  \key a \minor
  <a e a,>\breve
  <d, a' c>\breve
  <e a c>\breve
  <d a' c>\breve
  <e a c>\breve
  e'4 a, e a, e''4 a, e a,
  
  \chordmode {
    a,,,2.:m e,,2.:1.5 
    f,,2.:1.5 a,,,2.:1.5.8 ~
    a,,,2.:1.5.8
    
    a,,,2.:m
    e,,2.:1.5 f,,2.:1.5 
    a,,2.:1.5.8 ~ e,,2.:1.4.8
    
    d,,2.:m g,,2.: 
    e,,2.:1.5 f,,2.:1.5 
    a,,,2.:m e,,2.:1.5.8 ~
    e,,2.:1.5 g,,2.:1.4.6 
    a,,,\breve:m
  }

  <a c g'>\breve
  <c f a>\breve
  <e a c>1
  e'4 a, e a,
  
  \chordmode {
    a,,,2.:m c,,2.:
    d,,2.:1.5 e,,2.:1.5.8 ~
    e,,2.:1.5.8
    
    a,,,2.:m
    c,,2.: d,,2.:1.5 
    e,,2.:1.5.8

    a,,,:m
    d,,2.:m f,,2.: 
    a,,1:1.5.8 ~ a,,2:1.5
    
    a,,,2.:m e,,2.:1.5 ~
    e,,2.:1.5 g,,,2.:1.4.6 
    a,,,\breve:m
  }

  <a c g'>
  <c f a>\breve
  <e a c>1
  e'4 a, e a,

  \chordmode {
    a,,,2.:m c,,2.:1.5
    d,,2.:1.5 e,,2.:1.5.8 ~
    e,,2.:1.5.8
    
    a,,,2.:m
    c,,2.: a,,,2.:m 
    e,,2.:1.5

    a,,,:1.5
    a,,,2.:1.5 b,,,2.:1.4
    a,,1:1.5.8 ~ a,,2:1.5
    
    a,,,2.:m e,,2.:1.5 ~
    e,,2.:1.5 g,,,2.:1.4.6 
    a,,,\breve:m
  }

  <a c g'>
  <c f a>\breve
  <e a c>1
  e'4 a, e a,

  \chordmode {
    d,,2.: g,,2.:1.5
    e,,2.:1.5 f,,2.:1.5.8

    c,,2.:1.4
    g,,2.:1.5
    e,,2.:1.4 f,,2.:1.5.8 

    a,,,2.:m
    e,,:1.5 ~ e,,:1.5
    g,,,:1.4.6
    a,,,1.:1.5.8
    
    a,,,2.:1.5 e,,2.:1.5 ~
    e,,1.:1.5 g,,,1.:1.4.6 
    a,,,\breve:m
  }
  
  <dis a' c>1 ~ <a' c>1
  <c e a>\breve
  <a c e>
}

verseOne = \lyricmode {
  Is there some one out there to hear?
  The voic -- ing of my end -- less fear:
  that all I love will fade like grass,
  be -- fore the dark -- ness draw -- ing near.
  
  I beg each sea -- son to re -- turn,
  The wise to teach, the young to learn,
  The sand to stay be -- neath my feet,
  That not the towns and o -- ceans burn.

  May I sur -- vive my wan -- der -- lust,
  With time for love and for what is just
  May I af -- ford a chance to play.
  To live more life than what I must.
  
  All hope is si -- lent to me still
  I gird my heart and set my skill
  'Cause some -- one must and no one will
  'Cause some -- one must and no one will
}

\score {
  <<
    #(if (not (ly:get-option 'hidevoice)) #{
      \new Voice = "one" {
         \tempo 4 = 84
         \set Staff.midiInstrument = #"voice oohs"
         \set Staff.midiMinimumVolume = #0.8
         \set Staff.midiMaximumVolume = #1
         \set Staff.instrumentName = #(if (ly:get-option 'hidecello) "VOI&CEL" "VOICE")
         \set Staff.shortInstrumentName = #(if (ly:get-option 'hidecello) "VC" "V")
         \transpose a \mk \relative c' { \melody }
       }
      #} )
    #(if (not (ly:get-option 'hidevoice)) #{
      \new Lyrics \lyricsto "one" {
         \verseOne
       }
    #} )

    #(if (not (ly:get-option 'hidecello)) #{
      \new Voice  {
         \set Staff.midiInstrument = #"cello"
         \set Staff.midiMinimumVolume = #0.4
         \set Staff.midiMaximumVolume = #0.6
         \set Staff.instrumentName = #"CELLO"
         \set Staff.shortInstrumentName = #"C"
         \transpose a \mk \relative c { \clef bass
                        \melody }
       }
      #} )
    
    #(if (not (ly:get-option 'hidepiano)) #{
      \new PianoStaff <<
        \set PianoStaff.instrumentName = #"PIANO"
        \set PianoStaff.shortInstrumentName = #"P"
        \new Voice {
            \set Staff.midiInstrument = #"acoustic grand"
            \set Staff.midiMinimumVolume = #0.6
            \set Staff.midiMaximumVolume = #0.8
            \rp
        }
        \new Voice {
            \set Staff.midiInstrument = #"acoustic grand"
            \set Staff.midiMinimumVolume = #0.2
            \set Staff.midiMaximumVolume = #0.4
            \clef bass
            \lp
        }
      >>
      #} )
    
  >>
  \layout {}
  \midi {}
}