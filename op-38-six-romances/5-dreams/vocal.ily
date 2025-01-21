\version "2.24.4"

startUnremovableSection = \set Staff.keepAliveInterfaces =
    #'(rhythmic-grob-interface
    rest-interface
    lyric-interface
    percent-repeat-item-interface
    percent-repeat-interface
    stanza-number-interface)

endUnremovableSection = \unset Staff.keepAliveInterfaces


vox = \relative d'' {
    \key df \major
  \time 3/4
  \tempo "Lento"
  \tupletUp
  \override TupletBracket.bracket-visibility = ##t
    \compressEmptyMeasures
    \partial 8 r8
    \barNumberCheck #1
      R2.*2
      df4.^\mf df8 \tuplet 3/2 4 { df8 c ef } |
      df2 \tuplet 3/2 4 { bf4 ef8 }
      df2 \tuplet 3/2 4 { af4 f'8 } 
      df2^\p r4 |
      af'4.^\p df,8 \tuplet 3/2 4 { df ef df } |
      df4 \tuplet 3/2 4 { r8 df df ef df c } |
      c2. |
      \tuplet 3/2 4 { r8 c c df c ef df c c } |
      b4 ~ \tuplet 3/2 4 { b8 b b } ds4 |
      r4 b4.  cf8 |
      f4.^\p bf,4 bf8 |
      bf4 df4.^\mf \once\override Hairpin.X-offset = #-5 bf8^\> |
      bf4.^\p( cf8 bf8[ df] |
      bf8 
  \tempo "rit." 
        ef)^\markup { \italic "dim." } bf4. af8 |
  \tempo "(a tempo)"
      af2. |
    \barNumberCheck #18
    \startUnremovableSection
      \compressMMRests { R2.*4 } |
    \endUnremovableSection
      r4. r8 af^\markup { \dynamic p \italic "cantabile" } bf |
    \barNumberCheck #23
  \time 9/8
  \tempo "Meno mosso"
  \override Staff.TimeSignature.stencil = #(lambda (grob) (parenthesize-stencil (ly:time-signature::print grob) 0.1 0.4 0.4 0.1 ))
      df8 ef f af,4. ~ af8 bf af |
      bf8 c df f,4. ~ f4 r8 |
      r8 gf af a4. ~ a8 b c | 
      df4. ~ df8 ef f gf f bf |
      df,4. ~ df8 ef^\< f gf^\f f ef |
      f4. ~f8 ef^\markup { \italic "dim." } df f ef df |
    \time 6/8
      ef4. r8 df c |
      bf af f' df4. |
    \time 9/8
      r8 c df bf af af' df,4. ~
    \time 6/8
      df4. r4.
      R2.
    \time 9/8
        R8*9
    \time 3/8
        R4.*3
    \time 3/4
        R2.*2
    \fine
}