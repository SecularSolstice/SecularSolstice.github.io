\version "2.18.2"

\header {
  title = "Holding up the Sky"
  subtitle = "A Song of Morning"
  composer = "Daniel Speyer"
  copyright = "CC-SA-BY"
}

mk = #(if (ly:get-option 'drop) #{ g #} #{ c #} )

melody =  \transpose c \mk \relative c' {
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
    r4 c8 c c4 b c a' g2
  }
    \alternative {
      {
        r4 c,4 e f g e f g a
        a g f e f g f c
        c e g a d, f a b
        b a g b a g f c2
        r4 c c f f d d g g
        g f e d f e d c
        c c e e f g b b
        b a g f a g e c2
        r4 f g4 a b2
      }
      {
        \time 3/4
        \key f \major
        r2 c,4 d c bes
        a' bes a g2
        c,8 c d2 d4 e d e a2.
        r4 c,4 bes c d e bes' a f g2.
        r2 c,4 e f a bes2 r4  e,2. a2. c2. ~ c2.
      }
    }
  
}

harmony = \transpose c \mk  {
  \chordmode {
    c2.  g:m c f c e:1.3-.5- 
    c2. f e:1.3-.5- f 
    c f g:m a:m
    c a:m g:m f
    c f g:m a:m
    c f g:m f
    c a:m/e g:m a:m
    c d:m bes f
    d:m7 f e:dim c
    c d:m e:dim bes
    c c:7 d:m7 a:m7
    c c a:m f
    c d:m f c

    \key c \major
    a:m f a:m b1.:dim
    
    \repeat volta 3 {
      c1 g2
      c1 a2:m g
      d1:m e2:m/b a:m
      e1:m c2 b:dim
      g1 f2 d:m
      c1 a2:m g
    }
    
    \alternative {
      {
        c f g f a:m
        g f g c
        e:m f a:m b:dim
        a:m g f c
        c f e:m g g:7
        f e:m f c
        c f g b:dim
        a:m f g c
        f a:m b:dim
      }
      {
        \time 3/4
        \key f \major
        e2.:dim  bes f g:m
        d:m e:dim a:m
        c e:dim bes g:m
        c f bes e:dim a:m c1.:1.3.5.8
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
  A ray of sun or fel -- low cloud.
  To leave the fu -- ture war -- nings that
  You'd hard -- ly dare to speak a -- loud.
  To keen -- ly spot and stout -- ly face
  The hor -- rors lurk -- ing in the deep.
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
  >>
  \layout { }
  \midi {}
}
