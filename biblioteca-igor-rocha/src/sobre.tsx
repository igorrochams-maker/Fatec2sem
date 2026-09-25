import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import './sobre.css'
import Sobre from './sobremim'

createRoot(document.getElementById('root')!).render(
  <StrictMode>
    <Sobre />
  </StrictMode>,
)