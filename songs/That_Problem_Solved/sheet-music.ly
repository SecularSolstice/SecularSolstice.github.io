\version "2.18.2"

\header {
  title = "That Problem Solved"
  subtitle = "A Song of Dusk"
  composer = "Daniel Speyer"
  copyright = "CC-SA-BY"
}

chExceptionMusic = {
  <c>1-\markup{ \super 1 }
}
chExceptions = #( append
  ( sequential-music-to-chord-exceptions chExceptionMusic #t)
  ignatzekExceptions)


vocal = \relative c' {
  \numericTimeSignature \time 4/4
  r2. c4
  \repeat volta 4{
  g c f2 c4 r2
  c4 d d e d g2 r4
  g \break g8 g g r4 g4 g8[ g g] r4
  g4 g8 g g4 e c2 \break
  r2. c4 a c c c g' e c 
  c d d e d g2 r2
  r2. c,4 
  }
  \alternative { {    
  a c c c g' e c
  c a c c c a' f c
  c a c c c e e g2~ g4
  r2 c,4 a c c b c r r c
  }  
  {r2. c4 r2. c4 g c f2 c2 r r1 }
  }
}

harmony = \relative c' {
  \set chordNameExceptions = #chExceptions
  \numericTimeSignature
  g4 e c r
  \repeat volta 4{
  <g' b, d> r <f a c> r
  r c c r
  <d f a> r <e g b> r
  <g b d>2. r4
  <g b d>8 r2. <g b d>8 r2. <g b d>8 r
  r2 <c, e g>2
  g'4 e c r
  <a c e>4 r2.
  <g' b d>4 r2.
  <d f a>4 r2.
  <g b d>8[ <g b d><g b e><g b d f><g b d g>] r4. 
  g4 a, c r
  
  }
  \alternative { {
  <a' c, e>4 r2.
  <g b d>4 r2.
  <a c, e>4 r2.
  <a c e>4 r2.
  <a c, e>4 r2.
  <e g b>4 r <g b d>8 <g b d>8 <g b e>8 <g b d f>8 <g b d g>4 
  e4 c
  r4 r1 r4 c c r
  } {
  r a c r
  r a c r
  r1
  r1 <g c fis c'>
  } }
}
  
verseJacket = \lyricmode {
  got a pro -- blem...
  The wea -- ther's get -- ting cold
  The north -- ern wind blows harsh and swift
  My ja -- cket's worn and old
  But all I need to know is in
  the tales my pop -- pa told...
  I choose a pelt that's thick and warm.
  I mea -- sure twice; I chalk my form.
  I cut and stitch ere com -- ing storm!
  And now I'm safe and snug.
}

verseStars = \lyricmode {
  got a pro -- blem...
  It seems I've lost my way.
  I jour -- neyed forth to lands un -- known.
  Been wan -- de -- ring all day.
  I need some help. Can I re -- call:
  What did my mom -- ma say?
  I lift my eyes up past the air,
  fol -- low the tail of Great -- er Bear.
  I see that north is o -- ver there!
  And now I'm home -- ward bound.
  I
}

verseScience = \lyricmode {
got a pro -- blem...
What if this lore's not true?
What if what worked in days of old
don't work for me and you?
I don't des -- pair. I got a plan:
what grand -- pa said to do!
I check the facts with my own eyes
I do the math I an -- a -- lyze
I get a p less than oh five!
And now that pro -- blem's solved.
I
}

verseFail = \lyricmode {
got a pro -- blem...
Re -- sults won't rep -- li -- cate.
A gar -- den full of for -- king paths,
the choice to speak too late.
Can Sol' -- mo -- noff quite help me here?
Do I, um, hang on, wait!
I...
}
\score {
  <<
    \new Voice = "one" \with {
      \consists "Volta_engraver"
    }{
      \tempo 4 = 120
      \set Staff.instrumentName = #"MELODY"
      \vocal
    }
    \new Lyrics = "va"\lyricsto "one" {
      I
      <<
         \verseJacket
         \new Lyrics = "v2"
          \with { alignBelowContext = #"va" } {
           \set associatedVoice = "one"
           \verseStars
         }
      
         \new Lyrics = "v3"
           \with { alignBelowContext = #"v2" } {
             \set associatedVoice = "one"
             \verseScience
         }
         \new Lyrics = "v4" 
         \with { alignBelowContext = #"v3" } {
           \set associatedVoice = "one"
           \verseFail
         }
       >>
      I...
      I got a prob -- lem
    }
    \new Voice {
      \set Staff.instrumentName=#"PIANO"
      \clef "bass"
      \harmony
    }
  >>
  \layout {
      \context {
          \Score
          \remove "Volta_engraver"
    }
}
}

\score {
  <<
    \unfoldRepeats
    \new Voice = "one" {
      \tempo 4 = 120
      \set Staff.midiInstrument = #"voice oohs"
      \set Staff.midiMinimumVolume = #0.8
      \set Staff.midiMaximumVolume = #1
      \vocal
    }
    \unfoldRepeats
    \new Voice {
      \set Staff.midiInstrument = #"acoustic grand"
      \set Staff.midiMinimumVolume = #0.5
      \set Staff.midiMaximumVolume = #0.8
      \harmony
    }
  >>
  \midi {}
}