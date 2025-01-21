\version "2.24.4"
\language "english"

\include "paper.ily"
\include "vocal.ily"
\include "piano.ily"

\paper {
  %#(set-paper-size "letter")
  page-count = #5
  min-systems-per-page = #3
}

\header {
  title = \markup {
    \override #'(font-features . ("smcp"))
    "Сон"
  }
  subtitle = "The Dream"
  poet = \markup {
    \column {
      "Fyodor Sologub" %(Фёдор Сологу́б)
      \italic
        "Translation Edward Agate"
    }
  }
  dedication = "for Nina Koshits"
  titleRunner = "Сон"
  piece = "(The Dream)"
  composer = "Sergei Rachmaninoff"
  composerRunner = "Rachmaninoff"
  opus = "Opus 38.5"
  date = "1916"
  tagline = ##f
  % instrument = ""
}

\score {
  <<
    \new Staff = "Vox" \with { \consists "Ambitus_engraver" } <<
      \new Voice = "Vocal" \vox
      \include "lyrics.ily"
    >>
    \new PianoStaff \with { } <<
      \new Staff = "Up" <<
        \set subdivideBeams = ##t
        \new Voice \upper
        \new Voice \upperTwo
      >>
      \new Dynamics \dynamics
      \new Staff = "Down" \with { \clef bass \consists "Span_arpeggio_engraver" } <<
        \set Staff.connectArpeggios = ##t
        \set subdivideBeams = ##t
        \new Voice \lowerOne
        \new Voice \lowerTwo
        \new Voice \lowerThree
      >>
    >>
  >>
  \layout {
    \accidentalStyle piano
    \override Script.padding = #0.5
    \override TupletNumber.whiteout = ##t
    % \override TupletNumber.font-name = "Garamond Premier Pro Bold Italic"
    \override TupletNumber.font-name = "TeX Gyre Bonum bold italic"
    \context {
      \Staff
      \RemoveEmptyStaves
    }
  }
}
