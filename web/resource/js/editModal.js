$("#editUser").on('show.bs.modal', function(e) {
    var id = $(e.relatedTarget).data('id');
    var login = $(e.relatedTarget).data('login');
    var name = $(e.relatedTarget).data('name');
    var email = $(e.relatedTarget).data('email');

    $('#id').val(id);
    $('#login').val(login);
    $('#name').val(name);
    $('#email').val(email);
});