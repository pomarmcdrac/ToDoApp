String dateFormat(DateTime date) {
  final now = DateTime.now();
  final difference = now.difference(date);

  if (difference.inDays == 0) {
    return 'Hoy a las ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  } else if (difference.inDays == 1) {
    return 'Ayer a las ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  } else if (difference.inDays < 7) {
    return '${difference.inDays} días atrás';
  } else if (difference.inDays < 30) {
    return '${(difference.inDays / 7).floor()} semanas atrás';
  } else if (difference.inDays < 365) {
    return '${(difference.inDays / 30).floor()} meses atrás';
  } else {
    return '${(difference.inDays / 365).floor()} años atrás';
  }
}
