package view;

import apoio.IDAOT;
import entidade.Cliente;
import java.util.ArrayList;
import java.util.Vector;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author ruang
 */
public class jif_Listagem_DAO extends javax.swing.JInternalFrame {

    private final IDAOT DAOObject;
    private final jff_ITelaAlterarCadastro telaAlterar;

    private final DefaultTableModel tableModel;

    public jif_Listagem_DAO(IDAOT dao, jff_ITelaAlterarCadastro telaAlterar) {
        this.DAOObject = dao;
        this.telaAlterar = telaAlterar;

        initComponents();

        this.tableModel = (DefaultTableModel) jTable1.getModel();
        this.setTableColumns();
        this.setTableItems("");
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        jLabel1 = new javax.swing.JLabel();
        jbt_fechar = new javax.swing.JButton();
        jbt_visualizar = new javax.swing.JButton();
        jtf_Buscar = new javax.swing.JTextField();
        jbt_alterar = new javax.swing.JButton();
        jbt_detalhar = new javax.swing.JButton();

        setBackground(new java.awt.Color(238, 238, 238));
        setBorder(null);
        setClosable(true);
        setMaximizable(true);
        setResizable(true);
        setTitle("Visualizar");
        setMaximumSize(null);
        setVisible(true);
        getContentPane().setLayout(new java.awt.FlowLayout());

        jPanel1.setBackground(new java.awt.Color(238, 238, 238));
        jPanel1.setInheritsPopupMenu(true);
        jPanel1.setPreferredSize(new java.awt.Dimension(1000, 600));

        jTable1.setBackground(new java.awt.Color(250, 250, 250));
        jTable1.setForeground(new java.awt.Color(51, 51, 51));
        jTable1.setColumnSelectionAllowed(true);
        jTable1.setRowHeight(25);
        jTable1.setSelectionBackground(new java.awt.Color(13, 71, 161));
        jTable1.setSelectionForeground(new java.awt.Color(250, 250, 250));
        jTable1.setSelectionMode(javax.swing.ListSelectionModel.SINGLE_SELECTION);
        jTable1.setShowHorizontalLines(true);
        jTable1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jTable1MouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(jTable1);
        jTable1.getColumnModel().getSelectionModel().setSelectionMode(javax.swing.ListSelectionModel.SINGLE_INTERVAL_SELECTION);

        jLabel1.setBackground(new java.awt.Color(250, 250, 250));
        jLabel1.setForeground(new java.awt.Color(0, 0, 0));
        jLabel1.setText("Filtro:");

        jbt_fechar.setBackground(new java.awt.Color(13, 71, 161));
        jbt_fechar.setForeground(new java.awt.Color(255, 255, 255));
        jbt_fechar.setText("Fechar");
        jbt_fechar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jbt_fecharActionPerformed(evt);
            }
        });

        jbt_visualizar.setBackground(new java.awt.Color(13, 71, 161));
        jbt_visualizar.setForeground(new java.awt.Color(255, 255, 255));
        jbt_visualizar.setText("Visualizar");
        jbt_visualizar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jbt_visualizarActionPerformed(evt);
            }
        });

        jtf_Buscar.setBackground(new java.awt.Color(250, 250, 250));
        jtf_Buscar.setForeground(new java.awt.Color(0, 0, 0));

        jbt_alterar.setBackground(new java.awt.Color(13, 71, 161));
        jbt_alterar.setForeground(new java.awt.Color(255, 255, 255));
        jbt_alterar.setText("Alterar Cadastro");
        jbt_alterar.setEnabled(false);
        jbt_alterar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jbt_alterarActionPerformed(evt);
            }
        });

        jbt_detalhar.setBackground(new java.awt.Color(13, 71, 161));
        jbt_detalhar.setForeground(new java.awt.Color(255, 255, 255));
        jbt_detalhar.setText("Detalhar Cadastro");
        jbt_detalhar.setEnabled(false);
        jbt_detalhar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jbt_detalharActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                            .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(jbt_detalhar)
                            .addGap(18, 18, 18)
                            .addComponent(jbt_alterar)
                            .addGap(289, 289, 289)
                            .addComponent(jbt_fechar))
                        .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                            .addGap(0, 0, Short.MAX_VALUE)
                            .addComponent(jLabel1)
                            .addGap(18, 18, 18)
                            .addComponent(jtf_Buscar, javax.swing.GroupLayout.PREFERRED_SIZE, 373, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGap(18, 18, 18)
                            .addComponent(jbt_visualizar)))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(23, 23, 23)
                        .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 955, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(22, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addGap(23, 23, 23)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jtf_Buscar, javax.swing.GroupLayout.PREFERRED_SIZE, 34, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jbt_visualizar, javax.swing.GroupLayout.PREFERRED_SIZE, 36, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel1))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 470, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jbt_fechar)
                    .addComponent(jbt_detalhar, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jbt_alterar, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18))
        );

        getContentPane().add(jPanel1);

        pack();
    }// </editor-fold>//GEN-END:initComponents

    public void setTableColumns() {
        String[] colunasTabela = DAOObject.getTableColumns();
        for (String coluna : colunasTabela) {
            tableModel.addColumn(coluna);
        }
    }

    public void setTableItems(String termoBusca) {
        // Remove os itens da tabela
        this.tableModel.getDataVector().removeAllElements();
        this.tableModel.fireTableDataChanged();

        ArrayList<String[]> novosDados = this.DAOObject.paraListagemTabela(termoBusca);
        for (String[] row : novosDados) {
            this.tableModel.addRow(row);
        }

        tableModel.fireTableDataChanged();
    }

    private void jbt_fecharActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jbt_fecharActionPerformed
        //Fechar esta janela
        this.dispose();

    }//GEN-LAST:event_jbt_fecharActionPerformed

    private void jbt_visualizarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jbt_visualizarActionPerformed
        this.setTableItems(jtf_Buscar.getText());
        jbt_alterar.setEnabled(false);
        jbt_detalhar.setEnabled(false);
    }//GEN-LAST:event_jbt_visualizarActionPerformed

    private void jbt_alterarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jbt_alterarActionPerformed
        //Abrir tela de alteração e exclusão de cadastro
        int id = this.buscarNaTabela();
        this.telaAlterar.setDAO(DAOObject.consultarId(id));
        this.telaAlterar.setDetalhamento(false);
        this.telaAlterar.setTelaParente(this);
        this.telaAlterar.showWindow(true);

    }//GEN-LAST:event_jbt_alterarActionPerformed

    private void jbt_detalharActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jbt_detalharActionPerformed
        //Abrir tela de detalhamento de cadastro
        int id = this.buscarNaTabela();
        this.telaAlterar.setDAO(DAOObject.consultarId(id));
        this.telaAlterar.setDetalhamento(true);
        this.telaAlterar.setTelaParente(this);
        this.telaAlterar.showWindow(true);
    }//GEN-LAST:event_jbt_detalharActionPerformed

    private void jTable1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jTable1MouseClicked
        //Habilitar botões de alteração e detalhamento somente quando selecionar uma linha na tabela
        jbt_alterar.setEnabled(true);
        jbt_detalhar.setEnabled(true);
    }//GEN-LAST:event_jTable1MouseClicked

    private int buscarNaTabela() {
        //Buscar o cliente de acordo com a linha selecionada na tabela de visualização
        int rowIndex = jTable1.getSelectedRow();
        int IDAOTid = Integer.parseInt(((Vector) this.tableModel.getDataVector().elementAt(rowIndex)).elementAt(0).toString());
        return IDAOTid;
    }


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel jLabel1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable jTable1;
    private javax.swing.JButton jbt_alterar;
    private javax.swing.JButton jbt_detalhar;
    private javax.swing.JButton jbt_fechar;
    private javax.swing.JButton jbt_visualizar;
    private javax.swing.JTextField jtf_Buscar;
    // End of variables declaration//GEN-END:variables
}
