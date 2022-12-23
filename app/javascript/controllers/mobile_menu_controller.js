import { Controller } from "@hotwired/stimulus"

const ENTER_CLASSS_LIST = ['duration-200', 'ease-out']
const LEAVE_CLASSS_LIST = ['duration-100', 'ease-in']
const FROM_CLASS_LIST = ['opacity-0', 'scale-95']
const TO_CLASS_LIST = ['opacity-0', 'scale-95']

const wait = (ms) => {
  return new Promise((resolve)=> {
    setTimeout(() => {
      resolve()
    }, ms)
  })
}

// Connects to data-controller="mobile-menu"
export default class extends Controller {
  static targets = ['body']

  connect() {
    
  }

  open() {
    const el = this.bodyTarget
    el.classList.remove('hidden')
    el.classList.add(...ENTER_CLASSS_LIST, ...FROM_CLASS_LIST)
    requestAnimationFrame(() => {
      el.classList.add(...TO_CLASS_LIST)
      el.classList.remove(...ENTER_CLASSS_LIST, ...FROM_CLASS_LIST)
    })
  }

  async close() {
    const el = this.bodyTarget
    el.classList.add(...LEAVE_CLASSS_LIST, ...FROM_CLASS_LIST)
  
    await wait(200)
  
    el.classList.remove(...LEAVE_CLASSS_LIST, ...FROM_CLASS_LIST)
    el.classList.add('hidden')
  }
}
