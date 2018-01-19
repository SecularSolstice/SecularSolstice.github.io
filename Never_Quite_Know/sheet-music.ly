\version "2.16.2"

\header {
  title = "Never Quite Know"
  subtitle = "A Song of Dusk"
  composer = "Daniel Speyer"
  copyright = "CC-SA-BY"
}


global = {
  \time 3/4
%  \key g \minor
}

chExceptionMusic = {
  <c>1-\markup{ \super 1 }
}
chExceptions = #( append
  ( sequential-music-to-chord-exceptions chExceptionMusic #t)
  ignatzekExceptions)


voic = \relative c {
  \global
  \repeat volta 4 {
    \key g \major
  r2 \parenthesize d4 g d b g b d g b, d g \parenthesize d \parenthesize g,4 \break
  c4 g g c g g g' a g d r2 \break
  g,4 e fis g e fis g g a g \parenthesize fis g4 \break
  g4. g8 g4 g4. g8 g4 e' g e cis r2 \break
  
  \key g \minor  
  r4 g4 g g4. g8 g r g4. g8 g4 g4. g8 g4 d'4. g,8 r g8 \break
  g4. g8 g4 g g8 g4. f'2 g8 f d4 r4 g,  \break
  a f g a f g a a a c a a \break
  g g g g g g f' g f d r2  \break
  }
  
  r4 g,4 b c c c c c c c c c g' c, c4 \break
  g c g c r g8 g8 f'4 g f d r4 g,  \break
  a4 f g a f g a a a c a a8 a8 \break
  g4 g g g g g f' g f d r2  \break

  r4 g,4 g f g f g r2 \break
  r4 g4 g f g f g r2 \break
  r2. f4 g f g  r2  \break
  r2. r2. g
}

accomp =  \relative c{
  \global
  \chordmode {
    \repeat volta 4 {
      \key g \major
      g,,4 c, d, g,,2. b,,:1.3-.6- g,/d g,4 b,,:1.3-.6-.8 g,,
      c,2. c,:1.3.6 g, d, 
      g,, e,:m c,:1.3.6 g,, 
      g,,2. c, d,2. cis,4:1.3-.5- c,:m a,,:m
  
      \key g \minor
      g,,2.:m g,,:m g,,:m g,,:m d,:m 
      g,,:m g,,:m f,:m d,:m
      f,, f,, f,, c, 
      g,,:m g,,:m f,:m d,:m
  }
    
    s c,:m  c,:m c,:m g,:m
    g,,:m c,:m g,:m d,:m
    a,,:m a,,:m a,,:m a,,:m 
    g,,:m g,,:m f,:m d,:m
    
    s
    
    f,,4:m
  }
   g a <f aes c> g a f g a 
  f g a f g a f g a 
  f g a f g a f g a f g a  
}


verseOne = \lyricmode {
  \set stanza = "1."
The eye of a newt and the toe of a frog, _
_ Oi -- l for scent and a sha -- dow for sight,
Bone of the fa -- ther and en -- e -- my's blood, _
E -- merge might -- y gol -- em and set things to right

But you nev -- er quite know what will rise from the caul -- dron.
You nev -- er know what you'll un -- leash on the world.
You think and you plan; you com -- pute and you pon -- der.
You hope when the first of its flags is un -- furled.

 No you nev -- er quite know what will rise from the caul -- dron!
But worse is to sit and do no -- thing at all.
Our hi -- sto -- ry calls us to solve big -- ger pro -- blems.
But the more that we rise means the more we can fall!

And you nev -- er quite know.
No you nev -- er quite know.
Nev -- er quite know.
No.
}

verseTwo = \lyricmode {
  \set stanza = "2."
_  Love for your neigh -- bor, and struc -- ture for prayer, _
Hu -- mil -- i -- ty walk -- ing and com -- fort at night,
Few sil -- ly parts for out -- sid -- ers to laugh at,
E -- merge new re -- li -- gion and set things to right.
}

verseThree = \lyricmode {
  \set stanza = "3."
   A mis -- sion most worth -- y, a lead -- er and mass -- es,
A man -- ner in which to re -- solve an -- y fight,
Du -- ties and by -- laws, trad -- i -- tions to guide us,
E -- merge in -- sti -- tu -- tion and set things to right.
  
  
}
verseFour = \lyricmode {
  \set stanza = "4."
 _ All of the things that we wish that we wished for,
_ Keep -- ing of goals through -- out change be -- yond sight,
Stab -- le de -- ci -- sions in New -- comb -- like pro -- blems,
E -- merge friend -- ly A I and set things to right.
}

\score {
  <<
    \new ChordNames {
      \set chordNameExceptions = #chExceptions
      \accomp
    }
%  \new FretBoards {
%      \set Staff.instrumentName=#"GUITAR"
%      \set Staff.midiInstrument=#"acoustic guitar (nylon)"
%      \set Staff.midiMaximumVolume=#0.4
%      \accomp
%    }
    \new Voice = "voice" {
      \clef "bass"
      \voic 
    }
    \new Lyrics \lyricsto "voice" \verseOne
    \new Lyrics \lyricsto "voice" \verseTwo
    \new Lyrics \lyricsto "voice" \verseThree
    \new Lyrics \lyricsto "voice" \verseFour
    \new Voice {
       \clef "treble_8"
       \accomp
    }
   >>
  \layout { }
}
\score {
  <<
    \unfoldRepeats
    \tempo 4=100
    \new Voice {
      \set Staff.midiInstrument = "voice oohs"
      \voic
    }
    \new Voice {
      \set Staff.midiInstrument = "acoustic guitar (nylon)"
      \set Staff.midiMaximumVolume = #0.3
      \set Staff.midiMinimumVolume = #0.3
      \accomp
    }
  >>
  \midi {}
}