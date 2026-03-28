<script lang="ts">
  let {
    value = $bindable(0),
    min = 0,
    max = 100,
    step = 1,
    label = '',
    unit = '',
    color = 'var(--primary)',
  }: {
    value?: number
    min?: number
    max?: number
    step?: number
    label?: string
    unit?: string
    color?: string
  } = $props()

  const pct = $derived(((value - min) / (max - min)) * 100)

  function decrement() {
    value = Math.max(min, value - step)
  }

  function increment() {
    value = Math.min(max, value + step)
  }
</script>

<div class="slider-wrap">
  <div class="slider-header">
    <span class="slider-label">{label}</span>
    <span class="slider-value" style:color>
      {value}{unit}
    </span>
  </div>
  <div class="slider-row">
    <button class="stepper" onclick={decrement} disabled={value <= min} aria-label="Decrease {label}">
      <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="2"><path d="M4 8h8"/></svg>
    </button>
    <div class="slider-track">
      <input
        type="range"
        {min}
        {max}
        {step}
        bind:value
        style:--pct="{pct}%"
        style:--color={color}
      />
    </div>
    <button class="stepper" onclick={increment} disabled={value >= max} aria-label="Increase {label}">
      <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="2"><path d="M4 8h8M8 4v8"/></svg>
    </button>
  </div>
</div>

<style>
  .slider-wrap {
    padding: 10px 0;
  }

  .slider-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 10px;
  }

  .slider-label {
    font-size: 15px;
    font-weight: 500;
    color: var(--text);
  }

  .slider-value {
    font-family: var(--font-mono);
    font-size: 15px;
    font-weight: 700;
  }

  .slider-row {
    display: flex;
    align-items: center;
    gap: 10px;
  }

  .stepper {
    width: 36px;
    height: 36px;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-shrink: 0;
    background: var(--surface-elevated);
    border: 1px solid var(--border);
    border-radius: var(--radius-sm);
    color: var(--text-secondary);
    cursor: pointer;
    transition: all var(--duration-fast) var(--ease-out);
  }

  .stepper:hover {
    background: var(--surface-hover);
    color: var(--text);
  }

  .stepper:active {
    transform: scale(0.93);
  }

  .stepper:disabled {
    opacity: 0.25;
    pointer-events: none;
  }

  .stepper svg {
    width: 14px;
    height: 14px;
  }

  .slider-track {
    flex: 1;
    position: relative;
  }

  input[type="range"] {
    -webkit-appearance: none;
    appearance: none;
    width: 100%;
    height: 6px;
    border-radius: 3px;
    background: linear-gradient(to right, var(--color) 0%, var(--color) var(--pct), var(--border) var(--pct), var(--border) 100%);
    outline: none;
    cursor: pointer;
  }

  input[type="range"]::-webkit-slider-thumb {
    -webkit-appearance: none;
    appearance: none;
    width: 22px;
    height: 22px;
    border-radius: 50%;
    background: var(--text);
    box-shadow: 0 0 0 4px var(--bg), 0 2px 8px rgba(0, 0, 0, 0.4);
    cursor: pointer;
    transition: transform var(--duration-fast) var(--ease-spring);
  }

  input[type="range"]::-webkit-slider-thumb:active {
    transform: scale(1.15);
  }
</style>
