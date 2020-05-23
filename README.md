## Song Control 
This is an application I built for my final project at Flatiron School. It uses a Ruby on Rails API backend, a PostgreSQL database, and a React frontend. 

This app was designed to assist songwriters in their creative process. A user can create multiple versions of a song for easy reference and store them in collections for optimal organization. Each song has lyric formatter using the JavaScript library ChordSheetJS that places chord changes above the words and a tool to look up synonyms, rhymes, and definitions for a chosen word. 

## Motivation
I wanted to build this app because I am a songwriter myself and was tired of sifting through the numerous versions of songs that I had recorded. I often times will come up with alternate verses or choruses for a particular song. I wanted an apllication that could store all those versions in one place for quick and easy access. 

## Screenshots

![ScreenShot1](https://github.com/Joshua-Phelps/mod-5-songwriting-backend/blob/master/public/images/ScreenShot1.png "Screen Shot 1")

![ScreenShot2](https://github.com/Joshua-Phelps/mod-5-songwriting-backend/blob/master/public/images/ScreenShot2.png "Screen Shot 2")

![ScreenShot3](https://github.com/Joshua-Phelps/mod-5-songwriting-backend/blob/master/public/images/ScreenShot3.png "Screen Shot 3")

![ScreenShot4](https://github.com/Joshua-Phelps/mod-5-songwriting-backend/blob/master/public/images/ScreenShot4.png "Screen Shot 4")

![ScreenShot5](https://github.com/Joshua-Phelps/mod-5-songwriting-backend/blob/master/public/images/ScreenShot5.png "Screen Shot 5")

## Tech/framework used

<b>Built with</b>
- [React](https://reactjs.org/)
- [Ruby on Rails](https://rubyonrails.org/)
- [Material UI](https://material-ui.com/)


## Features
- A user can create a collection of songs for easy organization 
- A user can move a song between collections
- A user can create a new song and record multiple versions 
  - Those versions can be accessed from the song's webpage for quick reference
- A user can write and format lyrics to reference while recording
- A user can search for synonyms, rhymes, and definitions of words to assist with the lyric writing process. 
- A user can delete versions, songs, collections and well as their whole account if desired
- Uses Bcrypt and JWT tokens for login security 
- The recording are hosted on Amazon S3


## 

Check out the [demo](https://youtu.be/181d-tg6OPc)

Website live at https://song-control-client.herokuapp.com/ 

[Frontend Repo](https://github.com/Joshua-Phelps/mod-5-songwriting-client)

 

