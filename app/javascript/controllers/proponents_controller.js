import { Controller } from "stimulus";
import { debounce } from "lodash";

export default class extends Controller {
  static targets = ["inssDiscount"];
  static values = {
    grossSalary: Number,
  };

  connect() {
    this.calculateInssDiscountDebounced = debounce(
      this.calculateInssDiscount.bind(this),
      700
    );

    if (!!this.grossSalaryValue) {
      this.calculateInssDiscount({ target: { value: this.grossSalaryValue } });
    }
  }

  calculateInssDiscount(event) {
    const grossSalary = event.target.value;

    fetch("/api/proponents/calculate_inss_discount", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]')
          .content,
      },
      body: JSON.stringify({ gross_salary: grossSalary }),
    })
      .then((response) => response.json())
      .then((data) => {
        this.inssDiscountTarget.value = data.inss_discount;
      })
      .catch((error) => console.error("Error:", error));
  }
}
