class Scholarship < ActiveRecord::Base
  belongs_to :user
  belongs_to :camp_application
  has_one :payment
  validates :tournament, presence: true
  validates :round, presence: true  

  after_update :create_finaid_payment, if: :approval_given?
  after_update :remove_finaid_payment, if: :approval_removed?


  private

    def approval_given?
      approved_changed? && approved == true && approved_was != true
    end

    def approval_removed?
      approved_changed? && approved == false && approved_was == true
    end

    def remove_finaid_payment
      camp_app = self.camp_application
      pmt = Payment.find(self.payment_id)
      pmt.delete
    end

    def create_finaid_payment
      camp_app = self.camp_application
      amt = scholarship_amt_due
      if CalculateTuition.new(self.camp_application).max_scholarship_limit_allowed(amt)
        pmt = camp_app.payments.create(pmt_type: 'Scholarship', note: "Scholarship for #{self.tournament} #{ self.transfer ? 'From: ' + self.donor_name : ''}", amount: amt)
        pmt.save!
        update_column(:payment_id, pmt.id)
      else
        pmt = camp_app.payments.create(pmt_type: 'Scholarship', note: "Scholarship for #{self.tournament} #{ self.transfer ? 'From: ' + self.donor_name : ''} - Scholarship Limit Reached.", amount: 0.0)
        pmt.save!
        update_column(:payment_id, pmt.id)
      end
    end

    def scholarship_amt_due
      scholarship_pct = 0
      if self.tournament == 'hdshc'
        if self.round == "Finals"
          scholarship_pct = 0.30
        else
          scholarship_pct = 0.15
        end
      else
        if self.place == "1st"
          scholarship_pct = 0.2
        elsif self.place != "1st" && self.round == "Finals"
          scholarship_pct = 0.15
        else
          scholarship_pct = 0.1
        end
      end
      tuition = CalculateTuition.new(self.camp_application).base_tuition
      amt_due = tuition * scholarship_pct
      return amt_due
    end
end
