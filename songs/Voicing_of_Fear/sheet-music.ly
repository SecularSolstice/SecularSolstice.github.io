\version "2.18.2"

\header {
  title = "The Voicing of Fear"
  subtitle = "A Song of Night"
  composer = "Daniel Speyer"
  copyright = "CC-SA-BY"
}

melody = {
  \numericTimeSignature
  \key a \minor
  r1 r1 r1 r1 r1 r2 r4 r8

  a \time 6/8 c4 d8 e4 g8 f4 d8 a'4. ~a4
  a,8 c4 d8 e4 g8 f4 d8 a'4. ~a4
  a,8 d4 e8 g4 a8 e4 c8 f4
  a,8 a4 b8 e4.~ ~e4 f16([ c)] g4 f8 \time 4/4 a1
  
  r1 r r2 r4 r8
  
  a \time 6/8 a4 c8 c4 e8 d4 c8 e4. ~e4
  a,8 a4 c8 c4 e8 d4 c8 e4
  a,8 a4 d8 d4 g8 f4 d8 a'4. ~a4
  a,8 a4 b8 e4.~ ~e4 f16([ c)] g4 f8 \time 4/4 a1

  r1 r r2 r4 r8
  
  a \time 6/8 a4 c8 c4 e8 d4 c8 e4. ~ e4
  a,8 a4 c8 c4 e16 d16 c4 a8 e'4
  g,8 a4 g8 a4 g8 b4 a8 a'4. ~a4
  a,8 a4 b8 e4.~ ~e4 f16([ c)] g4 f8 \time 4/4 a1

  r1 r r2 r4 r8

  a8 \time 6/8 d4 e8 g4 a8 e4 c8 f4
  a,8 d4 e8 g4 a8 e4 c8 f4
  a,8 a4 b8 e4.~ ~e4 f16([ c)] g4 f8 a4. ~a4
  a8 a4 g'8 e4.~ ~e4 r8 r4 f16([ c16)] g4. f4 r8 \time 4/4 a1

  r r r
}

rp = \relative c'' {
  \numericTimeSignature
  \time 4/4
  \key a \minor
  r2 e8 r a,, r
  r2 a'8 r a, r
  r2 e''8 e, a a,
  c'8 c, g' g, c'8 c, g' g,
  e'8 a, e a,  e'' a, e a,
  e''8 a, e a,  e'' a, e a,
  
  r2. r4. r8 a''[ e a, e] r8 r4.
  r2. r8 a'[ a, e' e,] r8
  r d'' r r g,, r r e'' r r f,, r
  r4. r8 e''[ e, a e,] r r4.
  
  r4. a8 e'' a, e a,
  g'' g, d' d, g' g, d' d,
  f' c f, c f' c f, c
  a'' a, e' e, e' a, e a,
  
  r2. r4. r8 e''[ e, a a,] r
  r a'' r r e r r a, r r e r
  r8 a r r d, r r a r 
  r e''[ a, e a,] r
  r4. r8 a'[ a, e' e,] r r4.
  
  r2 e''8 a, e a,
  g'' g, d' d, g' g, d' d,
  f' c f, c f' c f, c
  a'' a, e' e, e' a, e a,

  r2. r4. r8 e''[ e, a a,] r
  r a'' r r a, r r r r r e, r
  r8 a'' r r a, r r a, r 
  r e''[ a, e a,] r
  r4. r8 a'[ a, e' e,] r r4.
  
  r2 e''8 a, e a,
  g'' g, d' d, g' g, d' d,
  f' c f, c f' c f, c
  a'' a, e' e, e' a, e a,
  
  r d' r r g,, r r e' r r f, r
  r d'' r r g,, r r e' r r f, r
  r4. r8 a''[ a, e' e,] r r4.
  r8 e'[ a, e a,] r
  r4. e''8[ a, e a,] a''[ e a, e] r8
  r2.
  r2 a8 e a, e
  dis'' a dis, a d' a d, a
  e''8 r e, r a'8 r a,, r r1
}

lp = \relative c {
  \numericTimeSignature
  \key a \minor
  <a e a,>1
  <d, a' c>1
  <e a c>1
  <d a' c>1
  <e a c>1
  e'8 a, e a, e''8 a, e a,
  
  \chordmode {
    a,,,4.:m e,,4.:1.5 
    f,,4.:1.5 a,,,4.:1.5.8 ~
    a,,,4.:1.5.8
    
    a,,,4.:m
    e,,4.:1.5 f,,4.:1.5 
    a,,4.:1.5.8 ~ e,,4.:1.4.8
    
    d,,4.:m g,,4.: 
    e,,4.:1.5 f,,4.:1.5 
    a,,,4.:m e,,4.:1.5.8 ~
    e,,4.:1.5 g,,4.:1.4.6 
    a,,,1:m
  }

  <a c g'>1
  <c f a>1
  <e a c>2
  e'8 a, e a,
  
  \chordmode {
    a,,,4.:m c,,4.:
    d,,4.:1.5 e,,4.:1.5.8 ~
    e,,4.:1.5.8
    
    a,,,4.:m
    c,,4.: d,,4.:1.5 
    e,,4.:1.5.8

    a,,,:m
    d,,4.:m f,,4.: 
    a,,2:1.5.8 ~ a,,4:1.5
    
    a,,,4.:m e,,4.:1.5 ~
    e,,4.:1.5 g,,,4.:1.4.6 
    a,,,1:m
  }

  <a c g'>
  <c f a>1
  <e a c>2
  e'8 a, e a,

  \chordmode {
    a,,,4.:m c,,4.:1.5
    d,,4.:1.5 e,,4.:1.5.8 ~
    e,,4.:1.5.8
    
    a,,,4.:m
    c,,4.: a,,,4.:m 
    e,,4.:1.5

    a,,,:1.5
    a,,,4.:1.5 b,,,4.:1.4
    a,,2:1.5.8 ~ a,,4:1.5
    
    a,,,4.:m e,,4.:1.5 ~
    e,,4.:1.5 g,,,4.:1.4.6 
    a,,,1:m
  }

  <a c g'>
  <c f a>1
  <e a c>2
  e'8 a, e a,

  \chordmode {
    c,,4.: g,,4.:1.5
    e,,4.:1.5 f,,4.:1.5.8

    c,,4.:1.4
    g,,4.:1.5
    e,,4.:1.4 f,,4.:1.5.8 

    a,,,4.:m
    e,,:1.5 ~ e,,:1.5
    g,,,:1.4.6
    a,,,2.:1.5.8
    
    a,,,4.:1.5 e,,4.:1.5 ~
    e,,2.:1.5 g,,,2.:1.4.6 
    a,,,1:m
  }
  
  <dis a' c>2 ~ <a' c>2
  <c e a>1
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
         \tempo 8 = 84
         \set Staff.midiInstrument = #"voice oohs"
         \set Staff.midiMinimumVolume = #0.8
         \set Staff.midiMaximumVolume = #1
         \set Staff.instrumentName = #(if (ly:get-option 'hidecello) "VOI&CEL" "VOICE")
         \set Staff.shortInstrumentName = #(if (ly:get-option 'hidecello) "VC" "V")
         \relative c' { \melody }
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
         \relative c { \clef bass
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