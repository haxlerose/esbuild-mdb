import { Controller } from "@hotwired/stimulus"
// import * as mdb from 'mdb-ui-kit'
// import { Input } from 'mdb-ui-kit'
import { Datatable } from 'mdb-ui-kit'

export default class extends Controller {
  static targets = ['renderElement']
  static values = { data: Object, style: Object }

  connect() {
    console.log('Home Controller Connected')
    console.log('dataValue below')
    console.log(this.dataValue)
    this.elementToRender()
  }

  elementToRender() {
    console.log('elementToRender function')
    new Datatable(
      this.renderElementTarget,
      this.dataValue,
      this.styleValue
    )
  }
}
