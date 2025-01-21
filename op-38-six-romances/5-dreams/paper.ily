\version "2.24.4"

\paper {
  #(define fonts
    (set-global-fonts
     #:roman "Garamond Premier Pro" ; russian character support
     ;#:music "ross"
     ;#:brace "ross"
   ))

  print-first-page-number = ##t

  ragged-last-bottom = ##f
  ragged-bottom = ##f
  ragged-last = ##f

  #(set-paper-size "arch a")
  % two-sided     = ##t
  % inner-margin  = 0.75\in
  % outer-margin  = 0.5\in
  left-margin   = 0.5\in
  right-margin  = 0.5\in
  top-margin    = 0.5\in
  bottom-margin = 0.5\in
  indent        = 0.25\in

  %top and bottom aligned across pages
    % User Variable
      %%% distance to top/bottom line of top\bottom staff from page's top\bottom edge
      top-staff-margin    = 1.0\in
      fist-staff-margin   = 3.0\in
      bottom-staff-margin = 1.0\in

    %% Align Top Staffs
      %%% set the basic distance of the top staff from the top margin
      %%% this formula takes into account the above settings, the current staff size, and adds
      %%% 2 staff spaces, since the reference position of the staff is its center line
      top-system-spacing.basic-distance   = #(+ (/ (- top-staff-margin top-margin) staff-space) 2)
      top-system-spacing.minimum-distance = 0
      top-system-spacing.padding          = -50 % set large negative padding in order to ignore the skyline
      top-system-spacing.stretchability   = 0   % do not stretch the distance

    %% Align bottom Staffs
      %%% set the basic distance of the top staff from the top margin
      %%% this formula takes into account the above settings, the current staff size, and adds
      %%% 2 staff spaces, since the reference position of the staff is its center line
      last-bottom-spacing.basic-distance   = #(+ (/ (- bottom-staff-margin bottom-margin) staff-space) 2)
      last-bottom-spacing.minimum-distance = 0
      last-bottom-spacing.padding          = -50 % set large negative padding in order to ignore the skyline
      last-bottom-spacing.stretchability   = 0   % do not stretch the distance

      top-markup-spacing.basic-distance   = 0
      top-markup-spacing.minimum-distance = 0
      top-markup-spacing.padding          = -50
      top-markup-spacing.stretchability   = 0

      markup-markup-spacing.basic-distance = 0
      markup-markup-spacing.minimum-distance = 0
      markup-markup-spacing.padding = -50
      markup-markup-spacing.stretchability = 0

      markup-system-spacing.basic-distance   = #(+ (/ (- fist-staff-margin top-margin) staff-space) 2)
      markup-system-spacing.minimum-distance = 0
      markup-system-spacing.padding          = -50
      markup-system-spacing.stretchability   = 0

   scoreTitleMarkup = \markup {
     \fill-line {
       \null
     }
   }
  bookTitleMarkup = \markup {
    \vspace #5
    \fill-line {
      \column {
          \line{
            \bold
            \abs-fontsize #10
            \override #'(font-features . ("smcp" "onum"))
              \fromproperty #'header:poet
          }
          \null
          \null

      }
      \column {
        \fill-line {
          \bold
          \abs-fontsize #32
            \fromproperty #'header:title
        }
        \fill-line {
          \italic
          \bold
          \abs-fontsize #16
            \fromproperty #'header:subtitle
        }
        \fill-line {
          \italic
          \abs-fontsize #8
            \fromproperty #'header:dedication
        }
      }
      \column {
        \right-align {
          \bold
          \abs-fontsize #10
          \override #'(font-features . ("smcp" "onum"))
            \fromproperty #'header:composer
          \bold
          \line {
            \abs-fontsize #10
            \override #'(font-features . ("smcp" "onum"))
              \fromproperty #'header:opus
              "—"
              \fromproperty #'header:date
          }
        }
      }
    }
  }

  oddHeaderMarkup = \markup {
    \fill-line{
      \line {
        \abs-fontsize #10
        \override #'(font-features . ("smcp" "onum"))
          \fromproperty #'header:titleRunner

        \abs-fontsize #8
        \override #'(font-features . ("smcp" "onum"))
          \fromproperty #'header:piece
      }
      % \line {
      %   \box {
      %     \abs-fontsize #10
      %       \fromproperty #'header:instrument
      %   }
      % }
      \line {
         \abs-fontsize #8
           \override #'(font-features . ("smcp" "onum"))
           \fromproperty #'header:opus
         \abs-fontsize #10
           \override #'(font-features . ("smcp" "onum"))
           \fromproperty #'header:composerRunner
         \if \should-print-page-number
            \bold
            \abs-fontsize #10
            \fromproperty #'page:page-number-string
      }
    }
  }

  evenHeaderMarkup = \markup {
    \fill-line{
      \line {
        \if \should-print-page-number
            \bold
            \abs-fontsize #10
            \fromproperty #'page:page-number-string
        \abs-fontsize #10
        \override #'(font-features . ("smcp" "onum"))
          \fromproperty #'header:titleRunner

        \abs-fontsize #8
        \override #'(font-features . ("smcp" "onum"))
          \fromproperty #'header:piece
      }
      % \line {
      %   \box {
      %     \abs-fontsize #10
      %       \fromproperty #'header:instrument
      %   }
      % }
      \line {
         \abs-fontsize #8
           \override #'(font-features . ("smcp" "onum"))
           \fromproperty #'header:opus
         \abs-fontsize #10
           \override #'(font-features . ("smcp" "onum"))
           \fromproperty #'header:composerRunner
      }
    }
  }
}
