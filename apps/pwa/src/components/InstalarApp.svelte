<script lang="ts">
  import { onMount, onDestroy } from 'svelte'

  export let installPrompt: any
  export let onInstalado: () => void
  export let onCerrar: () => void

  const DURACION = 30 // segundos de espera máxima
  let progreso = 0
  let segundos = 0
  let instalando = false
  let listo = false
  let intervalo: ReturnType<typeof setInterval>

  const pasos = [
    { en: 0,  texto: 'Preparando la aplicación…' },
    { en: 5,  texto: 'Cargando recursos offline…' },
    { en: 12, texto: 'Configurando almacenamiento local…' },
    { en: 20, texto: 'Activando modo sin internet…' },
    { en: 27, texto: 'Casi listo, un momento…' },
  ]

  $: pasoActual = [...pasos].reverse().find(p => segundos >= p.en) ?? pasos[0]

  onMount(() => {
    instalando = true
    intervalo = setInterval(() => {
      segundos += 1
      progreso = Math.min((segundos / DURACION) * 100, 99)

      // Si el prompt ya está disponible, dispararlo inmediatamente
      if (installPrompt) {
        clearInterval(intervalo)
        dispararInstalacion()
      }

      // Tiempo máximo alcanzado sin prompt — mostrar instrucciones manuales
      if (segundos >= DURACION) {
        clearInterval(intervalo)
        listo = true
        instalando = false
      }
    }, 1000)
  })

  onDestroy(() => clearInterval(intervalo))

  async function dispararInstalacion() {
    progreso = 100
    instalando = false
    if (!installPrompt) {
      listo = true
      return
    }
    installPrompt.prompt()
    const { outcome } = await installPrompt.userChoice
    if (outcome === 'accepted') {
      onInstalado()
    } else {
      listo = true
    }
  }

  // Detectar navegador para instrucciones manuales
  const ua = navigator.userAgent
  const esIOS     = /iphone|ipad|ipod/i.test(ua)
  const esSamsung = /samsungbrowser/i.test(ua)
  const esFirefox = /firefox/i.test(ua)
</script>

<div class="overlay" on:click={onCerrar}>
  <div class="modal" on:click|stopPropagation>
    <button class="cerrar" on:click={onCerrar}>✕</button>

    {#if instalando}
      <!-- ── Pantalla de progreso ── -->
      <div class="progreso-container">
        <div class="icono-app">📲</div>
        <h2>Instalando VOCES UNIDAS</h2>
        <p class="paso-texto">{pasoActual.texto}</p>

        <div class="barra-fondo">
          <div class="barra-fill" style="width: {progreso}%"></div>
        </div>

        <p class="porcentaje">{Math.floor(progreso)}%</p>

        <div class="indicadores">
          <div class="indicador" class:activo={segundos >= 0}>
            <span class="dot"></span> Aplicación
          </div>
          <div class="indicador" class:activo={segundos >= 8}>
            <span class="dot"></span> Datos offline
          </div>
          <div class="indicador" class:activo={segundos >= 16}>
            <span class="dot"></span> Modo sin internet
          </div>
          <div class="indicador" class:activo={segundos >= 24}>
            <span class="dot"></span> Configuración final
          </div>
        </div>
      </div>

    {:else if listo}
      <!-- ── Instrucciones manuales si el prompt no llegó ── -->
      <div class="manual">
        <div class="icono-app">📲</div>
        <h2>Un paso más</h2>
        <p class="sub">Tu navegador requiere que completes la instalación manualmente:</p>

        {#if esIOS}
          <div class="pasos">
            <div class="paso"><span class="num">1</span><p>Toca el botón <strong>compartir ⎙</strong> en la barra inferior de Safari</p></div>
            <div class="paso"><span class="num">2</span><p>Toca <strong>"Añadir a pantalla de inicio"</strong></p></div>
            <div class="paso"><span class="num">3</span><p>Toca <strong>"Añadir"</strong> — ¡listo!</p></div>
          </div>
        {:else if esSamsung}
          <div class="pasos">
            <div class="paso"><span class="num">1</span><p>Toca el menú <strong>(⋮)</strong> arriba a la derecha</p></div>
            <div class="paso"><span class="num">2</span><p>Toca <strong>"Añadir página a"</strong> → <strong>"Pantalla de inicio"</strong></p></div>
            <div class="paso"><span class="num">3</span><p>Confirma tocando <strong>"Añadir"</strong></p></div>
          </div>
        {:else if esFirefox}
          <div class="pasos">
            <div class="paso"><span class="num">1</span><p>Toca el menú <strong>(⋮)</strong> arriba a la derecha</p></div>
            <div class="paso"><span class="num">2</span><p>Toca <strong>"Instalar"</strong></p></div>
          </div>
        {:else}
          <div class="pasos">
            <div class="paso"><span class="num">1</span><p>Toca el menú <strong>(⋮)</strong> arriba a la derecha en Chrome</p></div>
            <div class="paso"><span class="num">2</span><p>Toca <strong>"Instalar app"</strong> o <strong>"Añadir a pantalla de inicio"</strong></p></div>
            <div class="paso"><span class="num">3</span><p>Confirma tocando <strong>"Instalar"</strong></p></div>
          </div>
        {/if}

        <p class="nota">Una vez instalada funciona completamente sin internet.</p>
      </div>
    {/if}
  </div>
</div>

<style>
  .overlay {
    position: fixed;
    inset: 0;
    background: rgba(0,0,0,0.85);
    z-index: 1000;
    display: flex;
    align-items: flex-end;
  }
  .modal {
    background: #1a1a1a;
    border-radius: 20px 20px 0 0;
    padding: 2rem 1.5rem 2.5rem;
    width: 100%;
    border-top: 3px solid #c0392b;
    position: relative;
  }
  .cerrar {
    position: absolute;
    top: 1rem; right: 1rem;
    background: #2a2a2a; border: none;
    color: #888; width: 30px; height: 30px;
    border-radius: 50%; cursor: pointer; font-size: 0.9rem;
  }

  /* Progreso */
  .progreso-container { text-align: center; }
  .icono-app { font-size: 3rem; margin-bottom: 0.75rem; }
  h2 { font-size: 1.2rem; font-weight: 800; margin-bottom: 0.35rem; }
  .paso-texto { color: #888; font-size: 0.9rem; min-height: 1.4rem; margin-bottom: 1.5rem; }

  .barra-fondo {
    background: #2a2a2a;
    border-radius: 999px;
    height: 10px;
    overflow: hidden;
    margin-bottom: 0.5rem;
  }
  .barra-fill {
    height: 100%;
    background: linear-gradient(90deg, #c0392b, #e74c3c);
    border-radius: 999px;
    transition: width 1s linear;
  }
  .porcentaje { font-size: 0.8rem; color: #555; margin-bottom: 1.5rem; }

  .indicadores { display: flex; flex-direction: column; gap: 0.5rem; text-align: left; }
  .indicador {
    display: flex; align-items: center; gap: 0.6rem;
    font-size: 0.85rem; color: #555;
    transition: color 0.4s;
  }
  .indicador.activo { color: #eee; }
  .dot {
    width: 8px; height: 8px;
    border-radius: 50%;
    background: #333;
    transition: background 0.4s;
    flex-shrink: 0;
  }
  .indicador.activo .dot { background: #2ecc71; }

  /* Manual */
  .manual { text-align: left; }
  .manual .icono-app { text-align: center; display: block; }
  .manual h2 { text-align: center; margin-bottom: 0.5rem; }
  .sub { color: #888; font-size: 0.85rem; margin-bottom: 1.25rem; text-align: center; }
  .pasos { display: flex; flex-direction: column; gap: 0.85rem; margin-bottom: 1.25rem; }
  .paso { display: flex; align-items: flex-start; gap: 0.75rem; }
  .num {
    flex-shrink: 0;
    width: 1.6rem; height: 1.6rem;
    background: #c0392b; border-radius: 50%;
    display: flex; align-items: center; justify-content: center;
    font-weight: 800; font-size: 0.8rem;
  }
  .paso p { color: #ccc; font-size: 0.9rem; line-height: 1.5; margin: 0; }
  .paso strong { color: #fff; }
  .nota {
    font-size: 0.8rem; color: #555; text-align: center;
    border-top: 1px solid #2a2a2a; padding-top: 1rem;
  }
</style>
