String authErrosString(String? code) {
  switch (code) {
    case 'INVALID_CREDENTIALS':
      return 'Email e/ou senha invalidos';

    case 'Invalid session token':
      return 'Token Invalido';

    case 'INVALID_FULLNAME':
      return 'Ocorreu um erro ao cadastrar usuario: Nome invalido';

    case 'INVALID_PHONE':
      return 'Ocorreu um erro ao cadastrar usuario: Celular ivalido';

    case 'INVALID_CPF':
      return 'Ocorreu um erro ao cadastrar usuario: CPF invalido';

    default:
      return 'Um erro indefinido ocorreu';
  }
}
