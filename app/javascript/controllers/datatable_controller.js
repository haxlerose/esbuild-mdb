import { Controller } from "@hotwired/stimulus"
// import * as mdb from 'mdb-ui-kit'
// import { Input } from 'mdb-ui-kit'
import { Datatable } from 'mdb-ui-kit'

export default class extends Controller {
  static targets = ['renderElement']
  static values = { config: Array, data: Array, style: Object }

  connect() {
    console.log('Datatable Controller Connected')
    this.elementToRender()
  }

  elementToRender() {
    new Datatable(
      this.renderElementTarget,
      Object.fromEntries(this.datatableArguments()),
      this.styleValue
    )
  }

  datatableArguments() {
    return new Map([
      ['columns', this.configValue],
      ['rows', this.dataValue]
    ])
  }
}
