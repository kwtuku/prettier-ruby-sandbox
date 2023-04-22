import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["template"]

  add() {
    const childForm = this.templateTarget.content.cloneNode(true)
    const uniqueKey = Date.now()

    const labels = childForm.querySelectorAll("label")
    const selects = childForm.querySelectorAll("select")

    labels.forEach((label) => {
      label.htmlFor = label.htmlFor.replace(/_\d+_/, `_${uniqueKey}_`)
    })

    selects.forEach((select) => {
      select.id = select.id.replace(/_\d+_/, `_${uniqueKey}_`)
      select.name = select.name.replace(/\[\d+\]/, `[${uniqueKey}]`)
    })

    this.element.insertBefore(childForm, this.templateTarget)
  }
}
