\version "2.18.2"

\header {
  title = "Toast to the Fallen"
  composer = "Daniel Speyer"
  copyright = "CC-SA-BY"
}

chExceptionMusic = {
  <c>1-\markup{ \super 1 }
  <c e>1-\markup{ \super 1.3 }
  <c g>1-\markup{ \super 5 }

}
chExceptions = #( append
  ( sequential-music-to-chord-exceptions chExceptionMusic #t)
  ignatzekExceptions)


verseOne = \lyricmode {
  Here's to the folk of East -- er Is -- land
  Who's art we ad -- mi -- re to -- day
  Their numb -- ers and pow -- ers have dwind -- led 
  With the trees they re -- quired gone a -- way

  And here's to the lords of Mis -- sis -- sip -- pi
  Mys -- ter -- i -- ous buil -- ders of mounds
  They knew not the plagues that as -- sailed them
  We know not the names of their towns

  Yes and here's to the fi -- nal West -- ern Ro -- mans
  De -- voured from with -- out and with -- in
  Our scho -- lars still ask just what failed them
  Or how a -- ny cure might be -- gin
}

 chorus = \lyricmode {
  So we pour out a toast to the fal -- len
  And a -- no -- ther for those time for -- got 
  Who strove with the last ounce of cou -- rage
  But strove with e -- nough they did not
}

verseTwo = \lyricmode {
  Here's to the good old League of Na -- tions
  Whose quest was 'Pre -- vent Wor -- ld War'
  They hard -- ly im -- pe -- ded the se -- cond
  Now let's see how we face three and four

  And here's to the ones who saw it com -- ing
  Whose warn -- ings the world did not heed
  And here's to the ones who died work -- ing
  But had not the clues that they'd need

  Yes and here's to the ones who want -- ed bet -- ter
  But dared not take eyes off their foes
  And here's to their man -- sions that burned down
  The fires quite un -- quenched by their blows 
}

outro = \lyricmode {
  Yes we pour out a toast to the fal -- len
  And a toast for the ones who now fall
  And we won -- der if some -- day some -- bo -- dy
  Will pour out a toast for us all
}
  
melody = \relative c' {
              \tempo 4=150

\numericTimeSignature
  \time 4/4
  \repeat volta 2 {
    r1
    c2 d4 e a g a g e2 c2
    r2. c4 e r e e g2 e4 g d1
    r2. c4 d2 e4 f a2 e4 a e2 c
    r2 c4 e a2 d,4 f g2 b,4 c a1 \break

    r2. c4 d2 e4 f b a b a e2 c2
    r2. c4 e r e e a2 f4 a d,1
    r2. c4 d2 e4 f b2 f4 b g2 c,
    r2. c4 d2 c4 c e2 b4 c a1 \break

    r2 c4 d e2 f4 g c b c b e,2 c2
    r2. c4 e r e e b'2 g4 b d,1
    r2. c4 d2 e4 f c'2 g4 c g2 c,
    r2. c4 f2 d4 f a r b, c a1
    
    r1
    
    r2 c4 e g2 g4 g a4 r a g d2 a2
    r2 c4 d e2 e4 e4 f r4 c4 d4 a1
    r2 c g'2 e4 f \tuplet 3/4 {g a b} c2 a
    r2. c,4 e2 c4 e g r c, e a,1
 }
    r2 c4 e g2 a4 b c4 r c g d2 a2
    r2 c4 d e r e4 e4 g r4 c,4 d4 a1
    r2 c4 e f2 d4 f b2 g4 b g2 e
    r2. c4 d2 e4 f g r c, e a,1
}

accomp = {
  \chordmode {
      \repeat volta 2 {
    c1:1.5

    c1 a:m c
    c a:m e:m d:m
    c d:m a:m c
    c d:m c:1.5 a:m 
    
    c1 d:m b:m c
    c a:m f d:m
    c d:m b:m c
    c d:m e:m a:m
    
    c1 e:m c c
    c a:m g d:m
    c d:m c c
    c d:m f a:m
    
    e:m
    
    c g a:m a:1.4.5
    c e f a:1.4.5
    c g g:1.5 a:m
    c c:1.3.5.7 c a:m
      }
    c g c a:1.4.5
    c e:m c:1.3.5.7 a:1.4.5
    c d:m g e:m
    c d:m c/e  a:m
  }
}

\score {
  <<
      \new ChordNames {
        \set chordNameExceptions = #chExceptions
        \accomp
      }
      \new Voice = "voice" {
        \melody
      }
      \new Lyrics \lyricsto "voice" {
        <<
          \new Lyrics {\verseOne \chorus \outro}
          \new Lyrics \verseTwo
        >>
      }
    >>
  \layout {}
}

\score {
  <<
      \new ChordNames {
        \set ChordNames.midiInstrument=#"acoustic guitar (nylon)"
        \set ChordNames.midiMaximumVolume=#.5
        \set ChordNames.midiMinimumVolume=#.5
        \unfoldRepeats
        \accomp
      }
      \new Voice = "voice" {
        \set Staff.midiInstrument=#"voice oohs"
        \set Staff.midiMaximumVolume=#1
        \set Staff.midiMinimumVolume=#1
        \unfoldRepeats
        \melody
      }
    >>
  \midi {}
}