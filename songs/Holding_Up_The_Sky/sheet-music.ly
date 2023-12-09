\version "2.18.2"

#(set-global-staff-size 19)

\header {
  title = "Holding up the Sky"
  subtitle = "A Song of Morning"
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



mk = #(case (ly:get-option 'key)
       ((a) #{a,#})
       ((b) #{b,#})
       ((c) #{c#})
       ((d) #{d,#})
       ((e) #{e,#})
       ((f) #{f,#})
       ((g) #{g,#})
       (else #{c#}))
% #(print mk)
myclef = #(if (ly:pitch<? mk #{a,#}) #{ "treble_8" #} #{ treble #} )


melody =  \transpose c \mk \relative c' {
  \clef \myclef
  \tempo 4 = 130
  \numericTimeSignature
  \key f \major
  \time 3/4
  r2. r r r r r
  r2 c4 a'2 f4 bes2 g8 e8 f2.
  r2 c4 f2 c4 g'2 f8 g a2.
  r2 c,4 a'2 f4 g2 e8 e f2.
  r2 c4 f4 f f4 g4 f g a2.
  r2 c,4 a'2 g8 f8 g4 f e f2.
  r2 c4 e e e g2 f8 g a2.
  r2 c,4 d2 d4 bes' a g f2.
  r2 f4 a f a bes2 g8 e c2.
  r2 c4 d d d e2 d8 e g2.
  r2 c,4 c c c d2 c8 d f2.
  r2 c4 c c c a' g e f2.
  r2 c8 c d4 f d f a f c'2.

  \key c \major
  r f,2 g4 a2. b2. ~ b
  
  \repeat volta 3 {
    \time 2/4
    c,4 b c a' g2
    r4 c,4 c4 b c a' g2
    r4 d4 d4 c d b' a2
    r4 e4 e4 d e c' b2
    r4 b4 a4 g f e d2
    r4 c8 c c4 b c a' g2 r
  }
    \alternative {
      {
        r4 c,4 e f g e f g a
        r8 a g4 f e f g f c
        r8 c e4 g a d, f a b
        r8 b a4 g b a g f c2
        r4 c c f f d d g g
        r8 g f4 e d f e d c
        r8 c c4 e e f g b b
        r8 b a4 g f a g e c4. r8
        f2 g2 a2 b2
      }
      {
        \time 3/4
        \key f \major
        r2. r2 c,4 d c bes
        a' bes a g2
        c,8 c d2 d4 e4. d8 e4 a2.
        r4 c,4 bes c4. d8 e4 bes' a f g2.
        r2 c,4 e f a bes2 r4  e,2. a2. ~ a2 r4 c2. ~ c2.
      }
    }
  
}

harmony = \transpose c \mk  {
  \chordmode {
    \key f \major
    c2.  g:m c f c e:1.3-.5- 
    c2. f c:7 f 
    c f g:m a:m
    c a:m g:m f
    c f g:m a:m
    c f g:m f
    c a:m/e g:m a:m
    c d:m bes f
    d:m7 f bes:7+ c
    c d:m c:7 bes
    c c:7 d:m7 a:m7
    c c a:m f
    c d:m f c

    \key c \major
    a:m d:m f g1.
    
    \repeat volta 3 {
      c1 g2
      c1 a2:m g
      d1:m b2:dim a2:m
      e1:m c2 b:dim
      g1 f2 d:m
      c1 a2:m g g
    }
    
    \alternative {
      {
        c e:1.5 g f:1.5 a:m
        g e:^3 g c
        e:m d:m a:m b:dim
        a:m b:dim g c
        c f d:m g g:7
        f d:m e:m c
        c e:1.5 g b:dim
        a:m f g c
        d:m e:m f g
      }
      {
        \time 3/4
        \key f \major
        f2. e2.:dim  bes f g:m
        d:m e:dim a:m
        c e:dim bes g:m
        c f:7+ bes e:dim a1.:m c1.:1.3.5.8
      }
    }
  }
}

intro = \lyricmode {
  This game: it used to be fun
  To watch the clouds in the sky
  And see in each flu -- ffy one
  The bun -- ny or for -- tress passed by
  To name for each cas -- tle and whale
  The cob -- blers and kings li -- ving there
  To tell a whim -- si -- cal tale
  Of peo -- ple who dwell in the air
  But as those same tales take their wings
  The pow -- er of names stret -- ches forth
  And soon all those cob -- blers and kings
  Have their own lives of mean -- ing and worth

  So there's on -- ly...
}

 chorus = \lyricmode {
  Hold -- ing up the sky
  Still hold -- ing up the sky
  To crawl so men may fly
  Each step to ve -- ri -- fy
  Though de -- cades may pass by
  Al -- ways hold -- ing up the sky

}

versea = \lyricmode {
  To yearn for rest and still ask why
  To heed what toil and pain have found:
  Who'd build a ca -- stle in the sky
  Must plant the feet on so -- lid ground.
  To test and test each strand and curl,
  An -- ti -- ci -- pate how wind may blow,
  To know with fear the wide strange world,
  And lit -- tle trust what lore you know.

  So you can be...
}

verseb = \lyricmode {
  To hold like kin those too who bear
  A fel -- low cloud or so -- lar ray.
  To leave the fu -- ture war -- nings clear
  Of all you wish you'd known to -- day..
  To keen -- ly spot and stout -- ly face
  The worms that lurk be -- neath the deep.
  To know and choose when to let fall
  A flake of snow you can -- not keep.

  And you will be...
}

 
outro = \lyricmode {  
  There once was a dream of the youth
  And a game that chil -- dren could play
  What re -- mains is a glo -- ri -- ous truth
  Is that such a high price to pay?
}

\score {
  <<
    \new ChordNames {
      \set ChordNames.midiInstrument=#"acoustic guitar (nylon)"
      \set ChordNames.midiMaximumVolume=#0.5
      \set chordNameExceptions = #chExceptions
      \harmony
    }
    \new  Voice = "melody" {
      \set Staff.midiInstrument = #"voice oohs"
      \melody
    }
    \new Lyrics \lyricsto "melody" {
      \intro
      \chorus
      << 
        \versea 
        \new Lyrics \verseb 
      >>
      \outro
    }
    \new Voice {      \harmony     }
  >>
  \layout { }
}
\score {
  <<
        \unfoldRepeats
    \new ChordNames {
      \set ChordNames.midiInstrument=#"acoustic guitar (nylon)"
      \set ChordNames.midiMaximumVolume=#0.5
      \set chordNameExceptions = #chExceptions
      \harmony
    }
        \unfoldRepeats
    \new  Voice = "melody" {
      \set Staff.midiInstrument = #"voice oohs"
      \melody
    }
  >>
  \midi {}
}