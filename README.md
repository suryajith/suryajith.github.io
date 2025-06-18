# Suryajith Chillara's Website

This repository contains the source code for Suryajith Chillara's academic website, built with [Quarto](https://quarto.org/) and hosted on GitHub Pages.

## Repository Structure

- `main` branch: Contains the Quarto source files (.qmd, .yml, etc.)
- `gh-pages` branch: Contains the rendered HTML files served by GitHub Pages

## Local Development

1. Install [Quarto](https://quarto.org/docs/get-started/)
2. Clone this repository
3. Run `quarto preview` to preview the site locally
4. Edit the `.qmd` files as needed

## Deployment

To deploy changes to the live website:

1. Make your changes to the source files on the `main` branch
2. Commit and push your changes to `main`
3. Run the deployment script: `./deploy.sh`

The deployment script will:
- Render the Quarto website
- Switch to the `gh-pages` branch
- Copy the rendered files
- Commit and push to GitHub Pages

## Website URL

The live website is available at: https://suryajith.github.io

## Configuration

The main configuration is in `_quarto.yml`. The site is configured to publish directly to GitHub Pages using the `gh-pages` branch. 