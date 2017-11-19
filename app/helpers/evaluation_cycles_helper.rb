module EvaluationCyclesHelper
  def humanize_progress(boolean)
    boolean ? 'Finalizado' : 'Em andamento'
  end
end
