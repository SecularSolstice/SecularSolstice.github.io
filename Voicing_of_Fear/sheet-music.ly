\version "2.18.2"

\header {
  title = "The Voicing of Fear, Simplified"
  subtitle = "A Song of Night"
  composer = "Daniel Speyer"
  arranger = "shamelessly immitating Randall Thompson"
  copyright = "CC-SA-BY"
}

vocal = \relative c' {
  \numericTimeSignature
  \key c \minor
  r1 r1 r1 r1 r1 r2 r4 r8

  c \time 6/8 es4 f8 g4 bes8 as4 f8 c'4. ~c4
  c,8 es4 f8 g4 bes8 as4 f8 c'4. ~c4
  c,8 f4 g8 bes4 c8 g4 es8 as4
  c,8 c4 d8 g4.~ ~g4 as16([ es)] bes4 as8 \time 4/4 c1
  
  r1 r r2 r4 r8
  
  c \time 6/8 c4 es8 es4 g8 f4 es8 g4. ~g4
  c,8 c4 es8 es4 g8 f4 es8 g4
  c,8 c4 f8 f4 bes8 as4 f8 c'4. ~c4
  c,8 c4 d8 g4.~ ~g4 as16([ es)] bes4 as8 \time 4/4 c1

  r1 r r2 r4 r8
  
  c \time 6/8 c4 es8 es4 g8 f4 es8 g4. ~ g4
  c,8 c4 es8 es4 g16 f16 es4 c8 g'4
  bes,8 c4 bes8 c4 bes8 d4 c8 c'4. ~c4
  c,8 c4 d8 g4.~ ~g4 as16([ es)] bes4 as8 \time 4/4 c1

  r1 r r2 r4 r8

  c8 \time 6/8 f4 g8 bes4 c8 g4 es8 as4
  c,8 f4 g8 bes4 c8 g4 es8 as4
  c,8 c4 d8 g4.~ ~g4 as16([ es)] bes4 as8 c4. ~c4
  c8 c4 bes'8 g4.~ ~g4 r8 r4 as16([ es16)] bes4. as4 r8 \time 4/4 c1

  r r r

}
rp = \relative c''' {
  \numericTimeSignature
  \time 4/4
  \key c \minor
  r2 g8 r c,, r
  r2 c'8 r c, r
  r2 g''8 g, c c,
  es'8 es, bes' bes, es'8 es, bes' bes,
  g''8 c, g c,  g'' c, g c,
  g'8 c, g c,  g'' c, g c,
  
  r2. r4. r8 c''[ g c, g] r8 r4.
  r2. r8 c'[ c, g' g,] r8
  r f'' r r bes,, r r g'' r r as,, r
  r4. r8 g''[ g, c g,] r r4.
  
  r4. c8 g'' c, g c,
  bes'' bes, f' f, bes' bes, f' f,
  as' es as, es as' es as, es
  c'' c, g' g, g' c, g c,
  
  r2. r4. r8 g''[ g, c c,] r
  r c'' r r g r r c, r r g r
  r8 c r r f, r r c r 
  r g''[ c, g c,] r
  r4. r8 c'[ c, g' g,] r r4.
  
  r2 g''8 c, g c,
  bes'' bes, f' f, bes' bes, f' f,
  as' es as, es as' es as, es
  c'' c, g' g, g' c, g c,

  r2. r4. r8 g''[ g, c c,] r
  r c'' r r c, r r r r r g, r
  r8 c'' r r c, r r c, r 
  r g''[ c, g c,] r
  r4. r8 c'[ c, g' g,] r r4.
  
  r2 g''8 c, g c,
  bes'' bes, f' f, bes' bes, f' f,
  as' es as, es as' es as, es
  c'' c, g' g, g' c, g c,
  
  r f' r r bes,, r r g' r r as, r
  r f'' r r bes,, r r g' r r as, r
  r4. r8 c''[ c, g' g,] r r4.
  r8 g'[ c, g c,] r
  r4. g''8[ c, g c,] c''[ g c, g] r8
  r2.
  r2 c8 g c, g
  fis'' c fis, c f' c f, c
  g''8 r g, r c'8 r c,, r r1
}

lp = \relative c {
  \numericTimeSignature
  \key c \minor
  <c g c,>1
  <f, c' es>1
  <g c es>1
  <f c' es>1
  <g c es>1
  g'8 c, g c, g''8 c, g c,
  
  \chordmode {
             es,,4:1.5 f,,8:1.5 g,,4:1.5 bes,,8:1.5 as,,4:1.5 f,,8:1.5 c,4.:1.5 ~ c,4:1.5
    c,,8:1.5 es,,4:1.5 f,,8:1.5 g,,4:1.5 bes,,8:1.5 as,,4:1.5 f,,8:1.5 c,4.:1.5 ~ c,4:1.5
    c,,8:1.5 f,,4:1.5 g,,8:1.5 bes,,4:1.5 c,8:1.5 g,,4:1.5 es,,8:1.5 as,,4:1.5
    c,,8:1.5 c,,4:1.5 d,,8:1.5 g,,4.:1.5 ~g,,4:1.5 as,,16:1.5 es,,:1.5 bes,,,4:1.5 as,,,8:1.5 c,,1:1.3-.5.8
  }
  
  <c es bes'>
  <es as c>1
  <g c es>2
  g'8 c, g c,
  
  \chordmode {
              c,,4:1.5 es,,8:1.5 es,,4:1.5 g,,8:1.5 f,,4:1.5 es,,8:1.5 g,,4.:1.5 ~g,,4:1.5 
    c,,8:1.5 c,,4:1.5 es,,8:1.5 es,,4:1.5 g,,8:1.5 f,,4:1.5 es,,8:1.5 g,,4:1.5 
    c,,8:1.5 c,,4:1.5 f,,8:1.5 f,,4:1.5 bes,,8:1.5 as,,4:1.5 f,,8:1.5 c,4.:1.5 ~c,,4:1.5 
    c,,8:1.5 c,,4:1.5 d,,8:1.5 g,,4.:1.5 ~g,,4:1.5 as,,16:1.5 es,,:1.5 bes,,,4:1.5 as,,,8:1.5 c,,1:1.3-.5.8 
  }

  <c es bes'>
  <es as c>1
  <g c es>2
  g'8 c, g c,

  \chordmode {
              c,,4:1.5 es,,8:1.5 es,,4:1.5 g,,8:1.5 f,,4:1.5 es,,8:1.5 g,,4.:1.5 ~g,,4:1.5 
    c,,8:1.5 c,,4:1.5 es,,8:1.5 es,,4:1.5 g,,16:1.5 f,,:1.5 es,,4:1.5 c,,8:1.5 g,,4:1.5 
    bes,,8:1.5 c,,4:1.5 bes,,8:1.5 c,,4:1.5 bes,,8:1.5 d,,4:1.5- c,,8:1.5 c,4.:1.5 ~c,4:1.5 
    c,,8:1.5 c,,4:1.5 d,,8:1.5 g,,4.:1.5 ~g,,4:1.5 as,,16:1.5 es,,:1.5 bes,,,4:1.5 as,,,8:1.5 c,,1:1.3-.5.8 
  }

  <c es bes'>
  <es as c>1
  <g c es>2
  g'8 c, g c,

  \chordmode {
              f,,4:1.5 g,,8:1.5 bes,,4:1.5 c,8:1.5 g,,4:1.5 es,,8:1.5 as,,4:1.5
     c,,8:1.5 f,,4:1.5 g,,8:1.5 bes,,4:1.5 c,8:1.5 g,,4:1.5 es,,8:1.5 as,,4:1.5
     c,,8:1.5 c,,4:1.5 d,,8:1.5 g,,4.:1.5 ~g,,4:1.5 as,,16:1.5 es,,:1.5 bes,,,4:1.5 as,,,8:1.5 c,,4.:1.5 ~ c,,4:1.5 
     c,,8:1.5 c,,4:1.5 bes,,8:1.5 g,,4.:1.5 ~g,,2.:1.5 bes,,,4.:1.5 as,,,4.:1.5 c,,1:1.3-.5.8 
  }
  
  <f c' es>1
  <es g c>
  <c es g>
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
    \new Voice = "one" {
         \tempo 8 = 84
         \set Staff.midiInstrument = #"voice oohs"
         \set Staff.midiMinimumVolume = #0.8
         \set Staff.midiMaximumVolume = #1
         \set Staff.instrumentName = #"VOICE"
         \set Staff.shortInstrumentName = #"V"
         \vocal
    }
    \new Lyrics \lyricsto "one" {
         \verseOne
    }
    #(if (not (ly:get-option 'voicepart)) #{
      \new PianoStaff <<
        \set PianoStaff.instrumentName = #"PIANO"
        \set PianoStaff.shortInstrumentName = #"P"
        \new Voice {
            \set Staff.midiInstrument = #"acoustic grand"
            \set Staff.midiMinimumVolume = #0.4
            \set Staff.midiMaximumVolume = #0.6
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