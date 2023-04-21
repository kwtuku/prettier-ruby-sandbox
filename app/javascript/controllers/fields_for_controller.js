import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["foo", "template"]

  add() {
    const newInput = this.templateTarget.content.cloneNode(true)
    const uniqueKey = Date.now()

    const labels = newInput.querySelectorAll("label")
    const selects = newInput.querySelectorAll("select")

    labels.forEach((label) => {
      label.htmlFor = label.htmlFor.replace(/_\d+_/, `_${uniqueKey}_`)
    })

    selects.forEach((select) => {
      select.id = select.id.replace(/_\d+_/, `_${uniqueKey}_`)
      select.name = select.name.replace(/\[\d+\]/, `[${uniqueKey}]`)
    })

    this.element.insertBefore(newInput, this.templateTarget)
  }
}
