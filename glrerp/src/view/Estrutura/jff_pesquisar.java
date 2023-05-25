package view.Estrutura;

import dao.EstruturaDAO;
import dao.ItemDAO;
import entidade.Item;
import javax.swing.JOptionPane;
import view.Item.jff_Alterar_item;

/**
 *
 * @author ruang
 */
public class jff_pesquisar extends javax.swing.JFrame {

    private jif_Cadastro_estrutura estrutura;
    private jff_Alterar_item item;
    private int pesquisa;
    private int item_id;
    private boolean exclusao_item;

    public jff_pesquisar(jif_Cadastro_estrutura estrutura, int qual_pesquisa) {
        this.item_id = 0;
        initComponents();
        this.estrutura = estrutura;
        this.pesquisa = qual_pesquisa;
        
        //Setar o nome dos botões e dos JLabels
        jLabel1.setText("");
        jbt_selecionar.setText("Selecionar");
        jbt_fechar.setText("Fechar");
        jbt_filtrar.setEnabled(true);
        jtf_filtro.setEnabled(true);
        this.setTitle("Pesquisa - Item");
        
        //Popular a tabela
        new ItemDAO().popularTabela(jtb_pesquisa, "");
    }

    public jff_pesquisar(jff_Alterar_item item, int item_id) {
        this.exclusao_item = false;
        initComponents();
        this.item = item;
        this.item_id = item_id;
        
        //Setar o nome dos botões e dos JLabels
        String item_descricao = new ItemDAO().consultarId(this.item_id).getDescricao();
        jLabel1.setText("Item a ser excluído: " + this.item_id + " - " + item_descricao);
        jbt_selecionar.setText("Continuar Exclusão");
        jbt_fechar.setText("Cancelar Exclusão");
        jbt_filtrar.setEnabled(false);
        jtf_filtro.setEnabled(false);
        this.setTitle("Pesquisa - Item/Uso do Insumo");
        
        //Popular a tabela
        new EstruturaDAO().popularTabelaItensConsomemInsumoX(jtb_pesquisa, this.item_id);
        JOptionPane.showMessageDialog(this, "Esse item que você deseja excluir foi encontrado como sendo INSUMO na estrutura de produto(s)"
                + "\n\n CUIDADO: Se você CONTINUAR COM A EXCLUSÃO irá retirar esse item da estrutura dos produtos listado!", "ITEM UTILIZADO COMO INSUMO EM ESTRUTURA", JOptionPane.WARNING_MESSAGE);
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        jtb_pesquisa = new javax.swing.JTable();
        jbt_fechar = new javax.swing.JButton();
        jbt_selecionar = new javax.swing.JButton();
        jtf_filtro = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();
        jbt_filtrar = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("PESQUISAR");

        jPanel1.setBackground(new java.awt.Color(238, 238, 238));
        jPanel1.setPreferredSize(new java.awt.Dimension(800, 450));

        jLabel1.setBackground(new java.awt.Color(250, 250, 250));
        jLabel1.setFont(new java.awt.Font("Segoe UI", 1, 12)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(0, 0, 0));
        jLabel1.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel1.setText("jLabel1");

        jtb_pesquisa.setBackground(new java.awt.Color(250, 250, 250));
        jtb_pesquisa.setForeground(new java.awt.Color(51, 51, 51));
        jtb_pesquisa.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Title 1", "Title 2", "Title 3", "Title 4"
            }
        ));
        jtb_pesquisa.setRowHeight(25);
        jtb_pesquisa.setSelectionBackground(new java.awt.Color(13, 71, 161));
        jtb_pesquisa.setSelectionForeground(new java.awt.Color(250, 250, 250));
        jtb_pesquisa.setSelectionMode(javax.swing.ListSelectionModel.SINGLE_SELECTION);
        jtb_pesquisa.setShowHorizontalLines(true);
        jScrollPane1.setViewportView(jtb_pesquisa);

        jbt_fechar.setBackground(new java.awt.Color(13, 71, 161));
        jbt_fechar.setForeground(new java.awt.Color(255, 255, 255));
        jbt_fechar.setText("Fechar");
        jbt_fechar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jbt_fecharActionPerformed(evt);
            }
        });

        jbt_selecionar.setBackground(new java.awt.Color(13, 71, 161));
        jbt_selecionar.setForeground(new java.awt.Color(255, 255, 255));
        jbt_selecionar.setText("Selecionar");
        jbt_selecionar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jbt_selecionarActionPerformed(evt);
            }
        });

        jtf_filtro.setBackground(new java.awt.Color(250, 250, 250));
        jtf_filtro.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jtf_filtro.setForeground(new java.awt.Color(0, 0, 0));
        jtf_filtro.setDisabledTextColor(new java.awt.Color(102, 102, 102));

        jLabel2.setForeground(new java.awt.Color(0, 0, 0));
        jLabel2.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        jLabel2.setText("Filtro");

        jbt_filtrar.setBackground(new java.awt.Color(13, 71, 161));
        jbt_filtrar.setForeground(new java.awt.Color(255, 255, 255));
        jbt_filtrar.setText("Pesquisar");
        jbt_filtrar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jbt_filtrarActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 788, Short.MAX_VALUE)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addComponent(jbt_selecionar, javax.swing.GroupLayout.PREFERRED_SIZE, 200, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(jbt_fechar, javax.swing.GroupLayout.PREFERRED_SIZE, 200, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 48, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(jtf_filtro)
                        .addGap(18, 18, 18)
                        .addComponent(jbt_filtrar)))
                .addContainerGap())
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 31, Short.MAX_VALUE)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jtf_filtro, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jbt_filtrar)
                    .addComponent(jLabel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 300, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jbt_selecionar)
                    .addComponent(jbt_fechar))
                .addContainerGap(33, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jbt_fecharActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jbt_fecharActionPerformed
        //Botão de fechar
        //Caso a tela de pesquisa tenha sido chamado pelo JIF_CADASTRO_ESTRUTURA
        if (this.item_id == 0) {
            this.dispose();
        }//Caso a tela de pesquisa tenha sido chamado pelo JFF_ALTERAR_ITEM
        else {
            this.exclusao_item = false;
            this.dispose();
            item.ExcluirCadastroItem(exclusao_item);
            
        }
    }//GEN-LAST:event_jbt_fecharActionPerformed

    private void jbt_selecionarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jbt_selecionarActionPerformed
        //Caso a tela de pesquisa tenha sido chamado pelo JIF_CADASTRO_ESTRUTURA
        if (this.item_id == 0) {
            String id_tabela = String.valueOf(jtb_pesquisa.getValueAt(jtb_pesquisa.getSelectedRow(), 0));
            int id_IntTabela = Integer.parseInt(id_tabela);

            if (this.pesquisa == 1) {
                estrutura.NomearItem(id_IntTabela);
            } else {
                estrutura.NomearInsumo(id_IntTabela);
            }
            this.dispose();
        } //Caso a tela de pesquisa tenha sido chamado pelo JFF_ALTERAR_ITEM
        else {
            Object[] options = {"Sim",
                "Não"};
            int n = JOptionPane.showOptionDialog(this,
                    "Essa exclusão é IRREVERSÍVEL e irá remover o ITEM da tela de ESTRUTURA.\nDeseja continuar?",
                    "EXCLUSÃO DE ITEM",
                    JOptionPane.YES_NO_OPTION,
                    JOptionPane.WARNING_MESSAGE,
                    null,
                    options,
                    options[0]);
            if (n == 0) {
                this.exclusao_item = true;
                this.dispose();
                item.ExcluirCadastroItem(exclusao_item);
                
            }
        }

    }//GEN-LAST:event_jbt_selecionarActionPerformed

    private void jbt_filtrarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jbt_filtrarActionPerformed
        new ItemDAO().popularTabela(jtb_pesquisa, jtf_filtro.getText());
    }//GEN-LAST:event_jbt_filtrarActionPerformed

    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(jff_pesquisar.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(jff_pesquisar.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(jff_pesquisar.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(jff_pesquisar.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                //new jff_pesquisar().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JButton jbt_fechar;
    private javax.swing.JButton jbt_filtrar;
    private javax.swing.JButton jbt_selecionar;
    private javax.swing.JTable jtb_pesquisa;
    private javax.swing.JTextField jtf_filtro;
    // End of variables declaration//GEN-END:variables
}
