\version "2.18.2"

\header {
  title = "Beyond All Towers"
  subtitle = "a.k.a. In Western Lands"
  composer = "Clamavi de Profundis"
  arranger = "Daniel Speyer"
  poet = "J.R.R. Tolkein"
  copyright = "CC-SA-BY"
}

samwords = \lyricmode {
  In west -- ern lands be -- neath the Sun
  the flowers may rise in Spring,
  the trees may bud, the w -- a -- ters run,
  the mer -- ry finch -- es sing.
  Or there may -- be 'tis cloud -- less night
  and sway -- ing beech -- es bear
  the Elv -- en stars as jew -- els white
  a -- mid their branch -- ing hair.
 
  Though here at jour -- ney's end I lie
  in dark -- ness bur -- ied deep,
  be -- yond all tow -- ers strong and high,
  be -- yond all moun -- tains steep,
  a -- bove all sha -- dows rides the Sun
  and Stars for ev -- er dwell:
  I will not say the Day is done,
  nor bid the Stars fare -- well.
}

sam = \relative c {
  \numericTimeSignature
  \clef "alto"
  \key g \minor
  r1 r r r r r r r r
  r2 r4. d8 g4 a bes4. a16( g) f4. g8 d4.
  d8 g4 a bes c a1
  r4. d,8 g4 a bes4. a16( g) \tuplet 3/8 {f g a } d,4.
  d8 d'4 c \time 2/4 a8 f4. \time 4/4 g1
  r4. d'8 f4 g bes,4. g8 ees'4 d c4.
  c8 d4 c bes2 a g4 r8 d' f4 g bes,4.
  g8 c4 d c4. bes8 a4 f bes2 c g1
  \key a \minor
  r1 r r r
  r2 r8 e a b c2 ~ c8 b16( a) g8 a e2
  r8 e a b c4 d b2 ~ b2
  r8 e, a b c2 ~ c8 b16( a) g8 a e2
  r4 r8 a e'4 g d8 g,4. a1
  r2 r8 d e16 g8. a4. g8 d4. r16 c e2.
  r8 a, g'4. fis8 d16 c8. ~ c4 e2
  r8 e, a b c2 ~ c8 b16( a) g8 a16( b) a2.
  r8 a e'4. d8 b2 r r4 r8 g8 ( a8) a ~ a2. r1
}

cello = \relative c {
  \numericTimeSignature
  \key g \minor
  \clef "bass"
  f,1 g ~ g ~
  g2 ~g4. d'8 g4 a bes4. a16( g) f4. g8 d4.
  d8 g4 a bes c g1 d ~ d ~ d ~ d ~ d a
  <d d'> <g g'> <d d'> <a a'>2 <g g'>1
  <d d'> <bes' bes'>2 <ees, ees'> <c c'> <d d'> <bes' bes'> <a a'> <g g'>1
  <bes bes'>2 <c, c'> <c c'> <a' a'> <bes bes'> <c c'> <g g'>1
  \key a \minor
  g4 a2. b8 a g2. a2 b8 a g4 <a a'>1 
  e'1 <c, c'> <g' g'> <c c'>2 <b b'>2 ~ <b b'>
  <e, e'> <c c'>1 <e e'> <g g'> <a a'>
  <c, c'>1 ~ <c c'> <e e'> ~ <e e'> ~ <e e'>
  <c' c'> <a a'> <e' e'>2 <b b'>2 ~ <b b'>2. r8 <g g'>8 <a a'>1 ~ <a a'>
  
}

guitar = \relative c'' {
  \numericTimeSignature
  \key g \minor
  \clef "treble"
  \chordmode {
    r1 r1 g:m g2:m d4:m r8 g:m
    r2 bes r d:m
    g4:1.3- a:1.3- bes:1.3 c':1.3-
    g1:m
  }
  d,4 f a d f a f r
  r1
  \chordmode {
    f2 d':m g4:1.3- a:1.3- bes:1.3 c':1.3- f1
    d2:m g:m bes f d:m d':m f g1:m
    d'2:m g4:m a:1 bes4. g8:1 ees4 g:1 c'4.:m g8:1 d4:m ees:1 g2:m7 f:7 ees:7+ r
    g:m a4:1 bes:1 c2:m a4:1 f:1 g2:m7 c':m7 g1:m
  }
  \key a \minor
  \chordmode {
    d4:m f f8:1 a:1 c':1 f':1 d:m c g4 g'8:1 d':1 b:1 g:1 a2:m g8 f e4:m a:m d:m e:m c
    r1 c e2:1.4.5 r8 e:1 a:1 b:1 c'4 d':m g2:7
    r1 c2. g4 e'2:m r a4:1.5 g':1.5 g8:1.5 g,4.:1.5 a1:m
    r1 r r r r c2. g4 a:m7 c':1 e':1 r e2:m g:7
  }
  g,4  b  d  g r2. g4 e c a r
}

\score {
  <<
      \new Voice = "one" {
         \tempo 4 = 84
         \set Staff.midiInstrument = #"voice oohs"
         \set Staff.midiMinimumVolume = #0.8
         \set Staff.midiMaximumVolume = #1
         \set Staff.instrumentName = #"Voice"
         \set Staff.shortInstrumentName = #"V"
         \sam
       }
      \new Lyrics \lyricsto "one" {
         \samwords
       }
      \new Voice {
         \tempo 4 = 84
         \set Staff.midiInstrument = #"Acoustic Guitar (Nylon)"
         \set Staff.midiMinimumVolume = #0.4
         \set Staff.midiMaximumVolume = #0.6
         \set Staff.instrumentName = #"Guitar"
         \set Staff.shortInstrumentName = #"G"
         \guitar
       }
      \new Voice {
         \tempo 4 = 84
         \set Staff.midiInstrument = #"cello"
         \set Staff.midiMinimumVolume = #0.4
         \set Staff.midiMaximumVolume = #0.6
         \set Staff.instrumentName = #"Cello"
         \set Staff.shortInstrumentName = #"C"
         \cello
       }
  >>	
  \layout {}
  \midi {}
}
