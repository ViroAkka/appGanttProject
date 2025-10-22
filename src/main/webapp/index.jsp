<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Gantt Project</title>
</head>
<body>
    <jsp:include page="menu.jsp" />
    
    <main>
        <div class="video">
            <div class="overlay">
                <div class="contenedor video-content">
                    <h2 class="mb-4">Gantt Project</h2>
                    <p>Guatemala</p>
                </div>
            </div>
            <video autoplay muted loop>
                <source src="img/video.mp4" type="video/mp4" />
            </video>
        </div>

        <section class="olimpiada">
            <div class="contenedor olimpiada-content">
                <div class="olimpiada-img">
                    <img loading="lazy"
                         width="200"
                         height="300"
                         src="${pageContext.request.contextPath}/img/gantt.jpg"
                         alt="Proyecto." />
                </div>
                <div class="olimpiada-text">
                    <h2 class="olimpiada-title">Gantt Project</h2>
                    <p class="date">Octubre 2025, Guatemala</p>
                    <p style="font-size: 20px">
                        <span style="font-weight: bold">Organiza, visualiza y haz realidad tus ideas.</span>

                        Cada gran logro comienza con un plan.
                        <span style="font-weight: bold">Gantt Project</span> es la herramienta que convierte tus metas en proyectos claros, estructurados y alcanzables. Desde la primera tarea hasta la última entrega, te acompañamos paso a paso con una gestión visual y potente que impulsa tu productividad.

                        Diseñado para equipos y líderes que quieren más que solo cumplir objetivos:
                         Quieren <span style="font-weight: bold">ver el progreso, anticipar desafíos y celebrar resultados.</span>

                        Crea tu propio camino hacia el éxito con una planificación precisa, informes detallados y una interfaz intuitiva que hace del trabajo un proceso fluido y motivador.

                        <span style="font-weight: bold">Gantt Project: donde cada tarea encuentra su propósito y cada proyecto cobra vida.</span>
                    </p>
                </div>
            </div>
        </section>
    </main>
                         
    <jsp:include page="footer.jsp" />
</body>


