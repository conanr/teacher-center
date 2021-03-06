class DonationLog < ActiveRecord::Base
  attr_accessible :date, :amount_funded_cents, :project_id
  belongs_to :project


  def self.donations_today_cents(project_id)
    DonationLog.where(:date => Date.today,
                      :project_id => project_id).first.amount_funded_cents
  end

  def self.donations_over_days_cents(project_id, days)
    donations = DonationLog.where(:date => Date.today - days..Date.today,
                                  :project_id => project_id).all
    donations.sum(&:amount_funded_cents)
  end

  def amount_funded
    (BigDecimal.new(amount_funded_cents.to_s) / 100).to_i
  end

end
