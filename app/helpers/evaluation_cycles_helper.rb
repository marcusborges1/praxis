module EvaluationCyclesHelper
  def humanize_boolean(boolean)
    boolean ? "Sim" : "Não"
  end

  def format_datetime(datetime)
    datetime.strftime("%d/%m/%Y")
  end
end
