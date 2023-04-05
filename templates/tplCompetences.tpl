
{% block competence %}

    {% for competence in competences %}

        <section class="content deletetable">
            <h1 class="editableText"> {{competence.getNom() }} </h1>
            <article  class="editableText">
                <div class="left">
                    <ul>
                        <li>{{competence.getDescription() }}</li>
                        <li><a href="{{competence.getLien()}}">Ce qui prouve ma competence</a> </li>
                    </ul>
                </div>
            </article>
            <button><img src="../img/trash.png" alt=""></button>
        </section>

    {% endfor %}

    <div class="container d-flex justify-content-center align-items-center">
            <button id="btnAjouterComp" class=" btn btn-floating btn-primary btn-lg"><i
                    class="fas fa-plus"></i></button>
    </div>

{% endblock %}