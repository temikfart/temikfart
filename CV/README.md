# My CV

Welcome to my CV repository! This repository contains my curriculum vitae in LaTeX format.
You are welcome to use and modify it for your own needs.
I use the customized `altacv.cls` template.

**Table of contents:**
- [Contents](#contents)
- [How to Build](#how-to-build)
   - [Using Build Script](#using-build-script)
   - [Using Overlead](#using-overleaf)
   - [Using TeXstudio](#using-texstudio)
- [How to Edit](#how-to-edit)
   - [Custom Features](#custom-features)
- [Template Credits](#template-credits)
- [License](#license)
- [Contact Me](#contact-me)

## Contents

- [`images`](/CV/images) - Images and Icons for the CV;
- [`pdf`](/CV/pdf) - There are placed result CVs in PDF format (created by the [`build.sh`](/CV/build.sh) script);
- [`build.sh`](/CV/build.sh) - The build script.
- [`CMakeLists.txt`](/CV/CMakeLists.txt) - The CMake configuration;
- [`custom-altacv.cls`](/CV/custom-altacv.cls) - The customized AltaCV LaTeX CV template;
- [`cv-en.tex`](/CV/cv-en.tex) - The main LaTeX source file for the English version of the CV;
- [`cv-ru.tex`](/CV/cv-ru.tex) - The main LaTeX source file for the Russian version of the CV;
- [`preamble.tex`](/CV/preamble.tex) - The preamble with global parameters for colors, fonts, icons, etc;

## How to Build

To build the CV, you can use my build script, any LaTeX editor or Overleaf, a popular online LaTeX editor.
Below are instructions for all methods.

### Using build script

**Prerequisites:**
- texlive installation
- LuaTeX compiler
- CMake v3.12 or above
- Bash

**Let's build:**

1. Read the usage by running `build.sh` without arguments:

   ```bash
   Usage: ./build.sh <filename> [<en|ru>=en] [<0|1>=0]
   where
       <filename>  filename of main Tex file without extension.
       <en|ru>=en  choose language for words wrap support.
          <0|1>=0  disable or enable bibliography compilation.
   ```

2. Build your CV using necessary arguments:
   
   ```bash
   bash build.sh cv-ru ru 0
   ```
   
   to build RU version of the CV without bibliography
   
   ```bash
   bash build.sh cv-en
   ```
   
   to build EN version of the CV without bibliography
   
   ```bash
   bash build.sh cv-en en 1
   ```
   
   to build EN version of the CV with bibliography

Result PDF file will be created in the `pdf` directory. All output files will be deleted automatically.

### Using Overleaf

1. Go to [Overleaf](https://www.overleaf.com/).
2. Create a new project and upload all the files from this repository.
3. Open `cv-en.tex` or `cv-ru.tex`.
4. Click on the "Recompile" button to build the CV.

Download PDF file using "Download PDF" button.

### Using TeXstudio

1. Download and install [TeXstudio](https://www.texstudio.org/).
2. Clone this repository to your local machine:
   
   ```bash
   git clone https://github.com/temikfart/temikfart.git
   ```

3. Open main.tex in TeXstudio.
4. Press F5 to compile and build the CV.

## How to Edit

You can edit the CV by modifying the `cv-*.tex` file.
The file is structured with sections for personal information, education, experience, skills, and more.
Simply replace the my personal data with your own information.

### Custom Features

- Added new "Telegram" field to tagline;
- Removed photo;
- Added new command `\cvjob` like `\cvevent` (but with colored link to the company) to show your work experience. Example:

  ```tex
  \cvjob{Assistant Engineer \cvtag{C++}}{\huawei Huawei -- System Engineering Lab}{Summer Internship 2022}{Huawei RRI}{https://career.huawei.ru/rri/en/}
  ```

- You can add pretty icons using package with [Font Awesome icons](https://fontawesome.com/);
- You can add your own icon by creating new commands like:

  ```tex
  \newcommand*\huawei{\raisebox{-0.15\totalheight}{\includegraphics[width=15pt]{images/huawei}}\hspace{.5ex}}
  ```
  where you can change
    - `-0.15` value to fit the height in the text,
    - `width` of the `images/huawei` image to edit the width,
    - `.5ex` to change indent between an icon and subsequent text,
    - image of the `huawei` icon. Just put at the `images` directory your icon or logo in `.png` or `.pdf` formats.

## Template Credits

This CV uses the AltaCV template created by [LianTze Lim](https://github.com/liantze).
You can find the original template and more information at the [AltaCV GitHub repository](https://github.com/liantze/AltaCV).

## License

Feel free to use and modify this CV template for your own purposes.
However, please give credit to the original template creator, LianTze Lim, if you distribute or share your modified version.
Do it under the conditions of the [LaTeX Project Public License](http://www.latex-project.org/lppl.txt).

## Contact Me

Thank you for checking out my CV repository! If you have any questions or suggestions, feel free to contact me directly.
