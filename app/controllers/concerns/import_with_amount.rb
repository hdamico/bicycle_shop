module ImportWithAmount
  extend ActiveSupport::Concern

  def duplicate_values_by_amount(import)
    import.csv_lines = duplicated_values(import).flatten.each_slice(import.headers.count - 1).to_a
    import.headers.except!('amount')
  end

  private

  def duplicated_values(import)
    csv_lines = delete_amount_values(import)
    retrieve_amounts(import).each_with_index.each_with_object([]) do |(amount, idx), duplications|
      amount.to_i.times { duplications << csv_lines[idx] }
    end
  end

  def delete_amount_values(import)
    import.csv_lines.clone.map(&:clone).each { |l| l.delete_at(amount_index(import)) }
  end

  def retrieve_amounts(import)
    import.csv_lines.map { |l| l.slice(amount_index(import)) }
  end

  def amount_index(import)
    @amount_index ||= import.headers.find_index { |k, _| k == 'amount' }
  end
end
