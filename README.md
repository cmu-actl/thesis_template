# ACTL Ph.D. Thesis Template

You can [use this repository template](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template) to start your thesis. It contains a basic skeleton structure built from [this CMU ECE thesis template](https://github.com/vzaliva/cmu-ece-thesis-template) and modified by Ruben Purdy (rpurdy@andrew.cmu.edu) to match the style of previous ACTL students. For posterity, the changes to [cmu-ece-thesis.sty](/cmu-ece-thesis.sty) have been marked with comments starting with `ACTL:`.

The thesis PDF is stored at [build/thesis.pdf](/build/thesis.pdf).

## Thesis Structure

The template  contains an example of how to organize sections/subsections into separate files using the `\subimport` command from the [import](https://ctan.org/pkg/import) package which allows relative path imports. [This Overleaf help page](https://www.overleaf.com/learn/latex/Management_in_a_large_project) has some tips for organizing large projects and motivates the use of the `import` package over other methods.

The abstract, acknowledgements, glossary, and main thesis LaTeX code are placed in the repo root, while the sections are organized under the `sections` folder.

There are a few commands you can uncomment in [thesis.tex](/thesis.tex) to alter the style or print a draft version with line numbers.

In order to support a glossary, there is also a [`.latexmkrc`](/.latexmkrc) file which is automatically picked up by the latex build system and updates the flow to also build the glossary (see https://tex.stackexchange.com/a/541990).

## IDE Setup

### VSCode

It's recommended to use [VSCode](https://code.visualstudio.com) as the text editor, as it has good LaTeX preview support and also integrates Copilot for writing suggestions. As a student, you can get Copilot Pro by following [these instructions](https://docs.github.com/en/copilot/managing-copilot/managing-copilot-as-an-individual-subscriber/getting-started-with-copilot-on-your-personal-account/getting-free-access-to-copilot-pro-as-a-student-teacher-or-maintainer). For a large document like a thesis, building the LaTeX on your local computer can be a lot faster than using Overleaf.

If you are using VSCode, or otherwise writing/building your thesis locally, you'll need to install a version of LaTeX. This repo has been tested using [TeX Live](https://www.tug.org/texlive/). If you want autoformatting (which is recommended), you also need to install [tex-fmt](https://github.com/WGUNDERWOOD/tex-fmt?tab=readme-ov-file#installation). Otherwise, you can remove this setting from [.vscode/settings.json](/.vscode/settings.json): `"latex-workshop.formatting.latex": "tex-fmt"`.

These extensions are recommended for VSCode:
- [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop)
- [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker)
- [GitHub Copilot](https://marketplace.visualstudio.com/items?itemName=GitHub.copilot)

LaTeX Workshop lets you build and preview your PDF inside of VSCode using the `View LaTeX PDF File` command. It will also auto-format your LaTeX code. Both building and formatting your LaTeX will happen on save based on the settings defined in [.vscode/settings.json](/.vscode/settings.json). 

Code Spell Checker will check spelling in your LaTex documents. You can add words to your local dictionary, stored in [.vscode/cspell.json](/.vscode/cspell.json). You can directly edit this file to add words, or use `Quick Fix -> Add: "WORD" to config: .vscode/cspell.json` when an unknown word is selected in your editor.

GitHub Copilot will suggest completions when you're writing. You can also use chat functionality to ask for suggestions or help. You can edit the text in [.github/copilot-instructions.md](/.github/copilot-instructions.md) to help guide suggestions.

### Other

If you'd like to manually build your thesis, you can use the included [Makefile](/Makefile). Running `make` will output the thesis to `build/thesis.pdf`.

## Pre-commit

There's a pre-commit config that will build the PDF before committing to make sure the PDF is up to date before you commit/push. To use it, first [install pre-commit](https://pre-commit.com/#install) (alternatively, you can install [pipx](https://pipx.pypa.io/stable/installation/#installing-pipx) then run `pipx install pre-commit` to install in a clean environment).

Then, run `pre-commit install` to install the hooks.