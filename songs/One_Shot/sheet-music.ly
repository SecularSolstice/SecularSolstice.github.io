\version "2.16.2"

\header {
  title = "One Shot"
  subtitle = "A Song of Dusk"
  composer = "Daniel Speyer"
  copyright = "CC-SA-BY"
}

melody = \relative c' {
  \time 2/4
  r2 r2 r2 r r r r r4 c e4. c8 f4 c g' f 
  r4 f g4. f8 e4 d e2 \break
  r4 f a a c c g f
  e f g f d4. c8 d2 \break
  
  r4 c c4. d8 d4 c e d
  r f g4. g8 b4 b c2 \break
  r4 f,4 g g a a c b a
  b a4. g8 g4. f8 g2 r \break

  \repeat volta 2 {

  r4 c, e4. c8 f4 c g' f 
  r4 f f f g4. f8 e4 d e2 \break
  r4 f a a c c g f
  e f g f d4. c8 d2 \break

  r4 c c4. d8 d4 c e d
  r e f f g4. g8 b4 b c2 \break
  r4 f,4 g g a a c b a
  b a g g4. c,8 c2 r \break
  
  r4 c e d f e g d
  r4 d f e g f a e \break
  r4 e g f a g b f~ ~f
  r f2 \break
  f2
  f4 f f f b2 f r b f
  r4 f f f f f f f b2 f r b f
  r4 f f f f f f f b2 f r b2 f2
  c ~ c 
  }
  a ~ a
}

accomp =  \relative c {
  \chordmode {
    c2 g c f c g c 
    c2 g c1 f g
    f c f g
    c2 g c1 f2 g2 c1
    f2 g1 c2 a:m f g c2
    
    g2
    
    \repeat volta 2 {

    c2 g c1 f1. g1
    f c f g
    c2 g c1 f1 g2 c1
    f2 g1 c2 a:m f g c2
    a:m
    c1 f d:m g e1.:m f1.
    d2:m f1 g2/b f1:7 g2/b f :7
    d1:m ~ f g2/b f1:7 g2/b f :7
    d1:m ~ f g2/b f1:7 g2/b f2:7
    
    c1
    }
    a:m
    
    
  }
}

verse_a = \lyricmode {
  A land of tit for tat -- ters
  Is what we'd hoped to be
  But time and place and cir -- cum -- stance
  Don't bend so ea -- si -- ly

  Our know -- ledge is -- n't per -- fect
  Of all that went be -- fore
  And just a sing -- le false de -- fect
  Be -- gets e -- ter -- nal war
  
}

verse_b = \lyricmode {
  Our ci -- ties swell with peo -- ple
  Un -- til the bulk you chance to meet
  Are not ones you will meet a -- gain
  In mar -- ket, field or street.

  Or there may come a meet -- ing
  With risk and con -- se -- quence so vast
  They ren -- der hard -- ly re -- le -- vant
  What comes once they've gone past

  Some dare to do us wrong here
  Does all this risk be -- long near?
  How can we move a -- long? We're...

  We're...
}

 chorus = \lyricmode {
  We're liv -- ing in a one shot.  One Shot.
  It's un -- for -- gi -- ving it's a one shot. One Shot.
  It's sink or swim -- ming with a one shot.  One shot.
  One...
}

verse_c = \lyricmode {
  One way we might re -- solve this
  Would be to read each o -- thers' source
  But thin -- ly slic -- ing li -- ving brains
  Has is -- sues, yes, of course.

  And if our minds were simp -- ler
  So we could parse a -- no -- ther's thought
  That al -- so might just make them sim -- ple
  Such that we could not

  I don't think this is solved now
  We wish that we'd e -- volved how
  This still is not re -- solved now....

  Now
}

outro = \lyricmode {
  shot
}
  

\score {
  <<
    \new ChordNames {
      \set ChordNames.midiInstrument=#"acoustic guitar (nylon)"
      \set ChordNames.midiMaximumVolume=#.5
      \unfoldRepeats
      \accomp
    }
    \new Voice = "voice" {
      \tempo 4=160
      \set Staff.midiInstrument=#"voice oohs"
      \set Staff.midiMaximumVolume=#1
      \set Staff.midiMinimumVolume=#1
      \unfoldRepeats
     \melody
    }
  >>
  \midi {}
}


\score {
  <<
    \new ChordNames {
      \accomp
    }
    \new Voice = "voice" {
      \set Staff.instrumentName = #"Voice"
      \set Staff.shortInstrumentName = #"V"
      \clef "treble"
      \tempo 4=160
     \melody
    }
    \new Lyrics \lyricsto "voice" {
        \verse_a
       
        <<
          \verse_b
          \new Lyrics {
            \verse_c 
          }
        >>
        \chorus
        \outro
    }
  >>
  \layout {}
}