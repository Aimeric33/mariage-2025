import AnimatedNumber from '@stimulus-components/animated-number'

export default class extends AnimatedNumber {
  static values = {
    start: Number,
    end: Number,
    duration: Number,
  }

  connect() {
    super.connect()
  }

  animate() {
    let startTimestamp = null

    const step = (timestamp) => {
      if (!startTimestamp) startTimestamp = timestamp

      const elapsed = timestamp - startTimestamp
      const progress = Math.min(elapsed / this.durationValue, 1)

      if (this.endValue < 10) {
        this.element.innerHTML = `0${Math.floor(progress * (this.endValue - this.startValue) + this.startValue).toString()}`
      } else {
        this.element.innerHTML = Math.floor(progress * (this.endValue - this.startValue) + this.startValue).toString()
      }

      if (progress < 1) {
        window.requestAnimationFrame(step)
      }
    }

    window.requestAnimationFrame(step)
  }
}
