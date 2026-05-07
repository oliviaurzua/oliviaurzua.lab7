# VetClinic App

## Setup Instructions
1. Run `bundle install`
2. Run `bin/rails db:setup`
3. Run `bin/rails server`

## System Dependencies
**Important:** This application requires `libvips` to generate image variants for Active Storage.
- On Ubuntu/Debian, install it running: `sudo apt install libvips`

## Sanitization Check
During the Action Text sanitization check, pasting `<script>alert(1)</script>` into the Trix editor was successfully sanitized. The script did not execute, and the raw text was safely rendered as escaped text on the show page.
