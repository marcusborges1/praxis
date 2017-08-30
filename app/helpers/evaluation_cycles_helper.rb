module EvaluationCyclesHelper
  def humanize_progress(boolean)
    boolean ? "Finalizado" : "Em andamento"
  end

  def format_datetime(datetime)
    datetime.strftime("%d/%m/%Y")
  end
end
