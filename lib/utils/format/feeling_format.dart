String feelingFormat(String? feeling) {
  if (feeling == null || feeling.isEmpty) {
    return 'Sin asignar';
  }

  switch (feeling.toLowerCase()) {
    case 'like':
      return 'Me gusto';
    case 'neutral':
      return 'Neutral';
    case 'dislike':
      return 'No me gusto';
    default:
      return feeling[0].toUpperCase() + feeling.substring(1);
  }
}
