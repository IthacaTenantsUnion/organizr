module TenanciesHelper
  def composite_rent(tenancy)
    rent_total = tenancy.rent_total
    rent_portion = tenancy.rent_portion

    if rent_total && rent_portion
      "$#{rent_portion} (of $#{rent_total})"
    elsif rent_total
      "$#{rent_total}"
    elsif rent_portion
      "$#{rent_portion} (portion)"
    else
      "Unknown"
    end
  end
end
