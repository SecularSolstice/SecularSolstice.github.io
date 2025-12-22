\version "2.18.2"

\header {
  title = "La Vie Bohème"
  subtitle = "From RENT, Lightly Modified"
  composer = "Jonathan Larson"
}

words = \lyricmode {
  "[G] Here" we sing
  For What -- e'er it's worth
  On this blue green pla -- net called moth -- er earth
  On this night when we ce -- le -- brate re -- birth
  Of that yell -- ow star we call our own
  We raise ou -- r glass, you bet your ass, to
  La vie Bo -- hème

  To days of in -- spir -- a -- tion
  Play -- ing hook -- y
  Mak -- ing some -- thing out of no -- thing
  The need to ex -- press
  To co -- mmun -- i -- cate
  To go -- ing a -- gainst the grain
  Go -- ing in -- sane
  Go -- ing mad

  To lov -- ing ten -- sion, no pen -- sion
  To more than one di -- men -- sion
  To starv -- ing for at -- ten -- tion
  Hat -- ing con -- ven -- tion
  Hat -- ing pre -- ten -- sion
  Not to men -- tion, of course
  Hat -- ing dear old Mom and Dad

  To rid -- ing your bike
  Mid -- day past the three piece suits
  To fruits
  To no ab -- so -- lutes
  "[E] To" Ab -- so -- lut
  "[G] To" choice
  To The Vil -- lage Voice
  To a -- ny pass -- ing fad

  To be -- ing an us, for once
  In -- stead of a them

  La vie Bo -- hème

  "[D] So" that's five mi -- so soup
  Four sea -- weed sa -- lad
  Three soy bur -- ger din -- ner
  Two to -- fu dog plat -- ter
  And one past -- a with meat -- less balls
  And thir -- teen or -- ders of fries
  Is that it here?

  "[G&E] Wine" and beer!

  "[E] To" hand craft -- ed beers made in lo -- cal brew -- e -- ries
  To yo -- ga, to yo -- gurt, to rice and beans and cheese
  To lea -- ther, to dil -- dos, to cur -- ry vin -- da -- loo
  To hue -- vos ran -- che -- ros and Ma -- ya An -- ge -- lou

  E -- mo -- tion, de -- vo -- tion, to cau -- sing a com -- mo -- tion
  Cre -- a -- tion, va -- ca -- tion

  "[G] Much" -- o mas -- tur -- ba -- tion

  "[E] Com" -- pass -- ion, to fash -- ion, to pass -- ion
  When it's new

  To Son -- tag
  To Sond -- heim
  To a -- ny -- thing ta -- boo
  "[G] Gins" -- berg, Dy -- lan, Cunn -- ing -- ham, and Cage
  Len -- ny Bruce
  Lang -- ston Hughes
  "[E] To" the stage
  "[G] To" U -- ta
  To Budd -- ha
  "[E] Pa" -- blo Ne -- ru -- da, too

  "[G&E] Why" Do -- ro -- thy and To -- to went ov -- er the ra -- in -- bow
  To blow off Aun -- tie Em

  "[All] La" vie Bo -- hème

  "[E] Bi" -- sex -- u -- als, tri -- sex -- u -- als, ho -- mo sa -- pi -- ens
  Car -- cin -- o -- gens, hal -- lu -- ci -- no -- gens, men
  Pee wee Her -- man
  Ger -- man wine, tur -- pen -- tine, Ger -- trude Stein
  An -- to -- ni -- o -- ni, Ber -- to -- lu -- cci, Ku -- ro -- sa -- wa
  Car -- mi -- na Bu -- ra -- na

  "[G] To" a -- path -- y, to en -- trop -- y, to em -- path -- y, ec -- sta -- sy
  "[G&E] Vac" -- lav Ha -- vel, The Sex Pis -- tols, A B C
  "[E] To" no shame, nev -- er play -- ing the Fa -- me Game

  "[G] To" ma -- ri -- jua -- na
  
  "[E] To" so -- do -- my
  It's be -- tween God and me
  "[All] To" S and M

  La vie Bo -- hème
  La vie Bo -- hème
  La vie Bo -- hème
}

LVBs_do_not_extract = \lyricmode {
  "[D] La" vie Bo -- hème
  La vie Bo -- hème
  La vie Bo -- hème
  La vie Bo -- hème
  La vie Bo -- hème
  La vie Bo -- hème
  La vie Bo -- hème
  La vie Bo -- hème
  La vie Bo -- hème
  La vie Bo -- hème
  La vie Bo -- hème
  La vie Bo -- hème
  La vie Bo -- hème
  La vie Bo -- hème
  La vie Bo -- hème
}

melody = \relative c' {
  \time 4/4
  \numericTimeSignature
  \key f \major
  r2 f4 g c2
  c8 g g4 ~ g8 a8 f2 
  \tuplet 3/2 { r8 d8 d} f4 f f8 e4 d8 ~ d4
  c8 a d4
  \tuplet 3/2 { r8 d8 d} d4 d8 e8 f f e d8 e2 r4
  a8 g
  \key d \major
  fis4 fis f fis b g b,
  r8 e8 d4 cis8 d e4 a, g' fis d e ~ e2 r4
  b4 b'2. cis,4 d1 ~ d1
  s s s s s
  r2 r4 s8 e fis fis e fis e d 
  e d e d e d e d e d e fis r
  b b fis4 a8 b4 e,8 f e d d e fis fis g a r fis b4 r8 fis fis g4 a fis8 d4 fis( fis8 g fis e e es4.)
  r8 es e es e fis r fis e d r d e e e f e d r 
  e e f e e e d f f e e d f f e e d s
  fis fis fis ~ fis d d d r4 e8 d e d4 e8 d4 fis2. ~ fis2. s8
  a a a r a a4 a8 a r a r fis a4 b4 b r8 g b4 r8 g g g a b r g b g b4
  r8 g g4 r8 e16 e e8 d4 f8( e4) s8 b'8 b b4 b b b8 ~ b4 r r r8
  e, f4 e8 f e4 r8 d ~ d4 d r r8 a' \tuplet 3/2 {a4 a a} a2
  r2 r8 b, cis b cis1 s s
  
  r8 fis fis fis e fis e fis
  e fis e fis e fis fis fis
  e fis e fis e fis fis fis
  e fis e fis e fis fis fis r1
  fis8 e fis e fis e fis4
  e8 fis b fis r2
  cis4 cis cis r
  r r r r8 a'
  a4 fis8 b a4 fis8 g a a fis b a4 r8 b a4 fis8 b a4 fis8 g
  a a fis b4 a a8
  a4 fis8 b a4 fis8 g a a fis b a4 r8 b a4 fis8 b a4 fis8 g
  a8 a fis b a4 r8 b
  a4 fis8 b a4 fis8 g a a fis b a4 r8 b a4 fis8 b a4 fis8 g
  e e e f e4 d8 a'8
  a4 fis8 b a4 fis8 g a a fis b a4 r8 b a4 fis8 b a4 fis8 g
  a8 a fis b a4 r4
  
  a4 a a8 a8 r4
  a8 a4  a a4 a8 ~ a4
  e16 fis8. e4 r g fis8 e4 e8 fis a
  r4 r8 e e e r fis fis fis r fis fis fis e d r4 e2.
  
  r2 r4 r8 e f4 e8 f e d d d
  r8 f e8 f e d d d e8 e4 e e e8 ~ e4
  r4 r8 b d b d1 ~ d r r
  d8 b a d8 b a d b a d b a a d b a a d b a a d r d r4 f8 f e d r4 
  d8 b a d8 b a d b a d b a a d b a b a  b a  b a r
  f' f f r f e d r
  a a a a a a a a a a a a a4 a a8 ~ a4 
  e'8 e e e r e e e e4 e e e r8 fis4 fis fis8 ~ fis fis fis fis fis fis e d e2 r2 
  r8 e8 fis fis e e r e
  f4 e8 d r d d e r f4 e8 d2
  r4 r8 e e e4 e8~ e4 r4 r8 b d b d1
  r4 b d b d1 
  r4 b d b d1 
}

decoration = \relative c {
 	
  s1 s s s s s s s s s s s s s
  s2 s8 e fis e fis r8 r4 r2	
  r2 r8 e fis e fis r8 r4 r2	
  r2 r8 e fis e fis r8 r4 r2	
  s2 s8 e fis e fis s8 s4 s2	
  s2 s8 e fis e fis s8 s4 s2	
  s2 s8 e fis e fis s8 s4 s2	
  s2 s8 e fis e fis s8 s4 s2	
  s2 s8 e fis e fis s8 s4 s2	
  s2 s8 e fis e fis s8 s4 s2	
  s2 s8 e fis e fis s8 s4 s2	
  s2 s8 e fis e fis s8 s4 s2	
  s2 s8 e fis e fis s8 s4 s2	
  s2 s8 e fis e fis s8 s4 s2	
  s2 s8 e fis e fis s8 s4 s2	
  s2 s8 e fis e fis s8 s4 s2	
}

harmony = {
  \chordmode {
    d1.:m/a c/g d:m/a c/g a1
    d s s s g d 
    s s s s s s s s s s s s s s s s s s s s s s s s
    a:7 s g:7 s d s a s bes g:m7 a:1.4.5 a c s e b2:m7 
    s s s s s s s s s s s s s s s 
    a1 d 
    s s s s s s s s s s s s s s s 
    a s g:7 s d s a s s bes a:1.4.5 a d s 
    e2 b:m7 e a 
    d1 
    s s s s  s s s 
    a:7 s g:7 s d s a s bes g:m7 a:1.4.5 a d
  }
}

\score {
  <<
    \new ChordNames {
      \harmony
    }
    \new Staff {
     <<
  \tempo 4=130
      \new Voice = "mel" { 
        \melody 
      }
      \new Voice = "dec" {
        \decoration 
      }
     >>
    }
    \new Lyrics \lyricsto "mel" {
      \words
    }
    \new Lyrics \lyricsto "dec" {
      \LVBs_do_not_extract
    }
  >>
  \layout {}
  \midi {}
}