namespace Wysylanie_email
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.subjectBox = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.receiverBox = new System.Windows.Forms.TextBox();
            this.contentBox = new System.Windows.Forms.RichTextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.sendButton = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // subjectBox
            // 
            this.subjectBox.Location = new System.Drawing.Point(67, 33);
            this.subjectBox.Name = "subjectBox";
            this.subjectBox.Size = new System.Drawing.Size(450, 20);
            this.subjectBox.TabIndex = 0;
            this.subjectBox.TextChanged += new System.EventHandler(this.subjectBox_TextChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(18, 36);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(40, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Temat:";

            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 13);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(46, 13);
            this.label2.TabIndex = 2;
            this.label2.Text = "Adresat:";
            // 
            // receiverBox
            // 
            this.receiverBox.Location = new System.Drawing.Point(67, 10);
            this.receiverBox.Name = "receiverBox";
            this.receiverBox.Size = new System.Drawing.Size(450, 20);
            this.receiverBox.TabIndex = 3;
            this.receiverBox.TextChanged += new System.EventHandler(this.receiverBox_TextChanged);
            // 
            // contentBox
            // 
            this.contentBox.Location = new System.Drawing.Point(12, 78);
            this.contentBox.Name = "contentBox";
            this.contentBox.Size = new System.Drawing.Size(505, 246);
            this.contentBox.TabIndex = 4;
            this.contentBox.Text = "";
            this.contentBox.TextChanged += new System.EventHandler(this.contentBox_TextChanged);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(12, 62);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(37, 13);
            this.label3.TabIndex = 5;
            this.label3.Text = "Treść:";
            // 
            // sendButton
            // 
            this.sendButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.sendButton.Location = new System.Drawing.Point(409, 330);
            this.sendButton.Name = "sendButton";
            this.sendButton.Size = new System.Drawing.Size(108, 23);
            this.sendButton.TabIndex = 6;
            this.sendButton.Text = "Wyślij";
            this.sendButton.UseVisualStyleBackColor = true;
            this.sendButton.Click += new System.EventHandler(this.sendButton_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(529, 359);
            this.Controls.Add(this.sendButton);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.contentBox);
            this.Controls.Add(this.receiverBox);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.subjectBox);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox subjectBox;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox receiverBox;
        private System.Windows.Forms.RichTextBox contentBox;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button sendButton;
    }
}

