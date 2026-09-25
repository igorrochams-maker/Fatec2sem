import Header from './components/header'
import Formacao from './components/formacao'
import Hablidade from './components/habilidade'
import Projetos from './components/projetos'
import Imagem from './components/imagem'
import Contato from './components/contato'

function Sobre() {
    return (
        <div>

            <Header />

            <main>
            <h1>Quem sou eu?</h1>
            <p>Meu nome é Igor tenho 19 anos, moro em Araçoiaba da Serra SP. Sou torcedor fanático do Santos e gosto muito de futebol e esportes em geral. Trabalho no Banco afinz como assistente de planejamento da central de relacionamento, lá eu desenvolvo automção e participo do processo de gestão da central de atendimento.</p>
            
            <Formacao />
            <Hablidade />
            <Projetos />
            <Contato />
            <Imagem />
            </main>
        </div>
    )
}

export default Sobre