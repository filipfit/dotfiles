import { MediaPlayer } from "./MediaPlayer.js"
const audio = await Service.import('audio')

const myLabel = Widget.Label({
  label: 'some example content',
})

const myBar = Widget.Window({
  name: 'bar',
  anchor: ['top', 'left', 'right'],
  child: myLabel
})

// Variable that updates its value to the current date every second
// Can be used by multiple Bars or other objects.
const date = Variable('', {
  poll: [1000, 'date']
})


// Represents a REUSABLE widget
function Bar(monitor = 0) {
  // Creates a label that is bound to the date variable that
  // always has the current date and time.
  const myLabel = Widget.Label({
    label: date.bind().as(v => `CURRENT DATE: ${v}`),
  })

  // // Changes myLabel to current date every second
  // Utils.interval(1000, () => {
  //   myLabel.label = Utils.exec('date')
  // })

  return Widget.Window({
    monitor,
    name: `bar${monitor}`,
    anchor: ['top', 'left', 'right'],
    child: myLabel
  })
}


function VolumeSlider(type = 'speaker') {
  return Widget.Slider({
    hexpand: true,
    drawValue: false,
    onChange: ({value}) => audio[type].volume = value,
    value: audio[type].bind('volume'),
  })
}

const speakerSlider = VolumeSlider('speaker')

const mediaPlayer = Widget.Window({
  class_name: "window-parent",
  name: "mpris",
  anchor: ["top", "right"],
  child: MediaPlayer()
})

App.config({
  style: "./style.css",
  windows: [mediaPlayer],
})

// Just to remove the error message from the import
export {  }