import { Controller } from "@hotwired/stimulus"
import * as mdb from 'mdb-ui-kit'
import { Input } from 'mdb-ui-kit'

export default class extends Controller {
  static targets = ['renderElement']
  static values = { data: Object }

  connect() {
    console.log('Home Controller Connected')
    console.log('dataValue below')
    console.log(this.dataValue)
    this.elementToRender()
  }

  elementToRender() {
    console.log('elementToRender function')
    new mdb.Datatable(
      this.renderElementTarget,
      {
        columns: [
          { label: 'Column 1', width: 100, fixed: true, sort: false },
          { label: 'Column 2'}
        ],
        rows: [
          ['Value 1', 'Value 2']
        ]
      },
      {
        bordered: true
      }
    )
  }
}
