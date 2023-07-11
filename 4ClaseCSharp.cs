using System;
using System.Data;
using System.Data.SqlClient;

public class EvaluacionTecnica
{
    private string connectionString;

    public EvaluacionTecnica(string connectionString)
    {
        this.connectionString = connectionString;
    }

    public DataSet EjecutarSELECT(string query)
    {
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
            DataSet dataSet = new DataSet();
            adapter.Fill(dataSet);

            return dataSet;
        }
    }

    public int EjecutarQUERY(string query)
    {
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            SqlCommand command = new SqlCommand(query, connection);
            int rowsAffected = command.ExecuteNonQuery();

            return rowsAffected;
        }
    }

    public int getCantidadFilas(string query)
    {
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            SqlCommand command = new SqlCommand(query, connection);
            SqlDataReader reader = command.ExecuteReader();

            int rowCount = 0;
            while (reader.Read())
            {
                rowCount++;
            }

            return rowCount;
        }
    }
}